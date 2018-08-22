class Beer < ApplicationRecord
  belongs_to :brewery
  belongs_to :style
  has_many :reviews
  has_many :users, through: :reviews
  has_many :venue_beers
  has_many :venues, through: :venue_beers

  def average_rating
    if reviews.count >= 1
      self.reviews.average(:rating).to_f
    else
      "No reviews yet!"
    end
  end

  # def self.best_beer
  #   joins(:reviews).group(:name).order(Arel.sql({reviews: 'AVG(:rating)'})).limit(1)
  # end

end
