class User < ApplicationRecord
  has_many :reviews
  has_many :beers, through: :reviews
  has_many :breweries, through: :beers
  has_many :styles, through: :beers
  has_many :active_relationships, class_name: 'Relationship',
    foreign_key: 'follower_id',
    dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship',
    foreign_key: 'followed_id',
    dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates_presence_of :name, :birthdate
  validate :able_to_drink?

  has_secure_password

  extend ReviewInfoable::ClassMethods
  include ReviewInfoable::InstanceMethods

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  # Uses current day to return a user's age as an integer
  def current_age
    age = Date.today.year - birthdate.year
    age -= 1 if Date.today < birthdate + age.years
    age
  end

  def able_to_drink?
    if !(current_age >= 21)
      errors.add(:birthdate, 'must be at least 21 years old.')
    end
  end

  def unique_beers_reviewed
    beers.uniq.size
  end

  def order_reviews_by_rating
    reviews.sort_by do |r|
      r.rating
    end.reverse
  end

  def highest_rated_reviews
    order_reviews_by_rating[0..2].delete_if {|r| r.rating < 3}
  end

  def highest_rated_beers
    highest_rated_reviews.map do |r|
      r.beer
    end
  end

  def highest_rated_beer_styles
    highest_rated_beers.map do |b|
      b.style
    end
  end

  def suggested_beers
    highest_rated_beer_styles.each_with_object({}) do |s, h|
      h[s] = s.highest_rated_beers
    end
  end

  def self.order_by_unique_beers_reviewed
    all.sort_by do |i|
      i.unique_beers_reviewed
    end
  end

  def self.most_unique_reviews
    order_by_unique_beers_reviewed.last
  end
end
