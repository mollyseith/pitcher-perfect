class Beer < ApplicationRecord
  belongs_to :brewery
  belongs_to :style
  has_many :reviews
  has_many :users, through: :reviews
  has_many :venue_beers
  has_many :venues, through: :venue_beers

  extend ReviewInfoable::ClassMethods
  include ReviewInfoable::InstanceMethods

  # calculates the average rating as a float for all reviews of a specific beer
  # if beer has no reviews, returns a string stating that fact
  def average_rating
    if reviews.count >= 1
      self.reviews.average(:rating).to_f
    else
      "No reviews yet!"
    end
  end

  # selects all beers that have been reviewed at least once
  def self.reviewed_beers
    all.select do |b|
      b.reviews_count > 0
    end
  end

  # orders all reviewed_beers according to their average_rating
  def self.order_by_avg_rating
    reviewed_beers.sort_by do |beer|
      beer.average_rating
    end
  end

  # selects the beer with the highest average_rating out of the beers ordered
  # by their average_rating
  def self.best_beer
    order_by_avg_rating[-1]
  end

  # selects the beer with the lowest average_rating out of the beers ordered
  # by their average_rating
  def self.worst_beer
    order_by_avg_rating[0]
  end
end
