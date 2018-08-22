class Beer < ApplicationRecord
  belongs_to :brewery
  belongs_to :style
  has_many :reviews
  has_many :users, through: :reviews
  has_many :venue_beers
  has_many :venues, through: :venue_beers

  # calculates the average rating as a float for all reviews of a specific beer
  # if beer has no reviews, returns a string stating that fact
  def average_rating
    if reviews.count >= 1
      self.reviews.average(:rating).to_f
    else
      "No reviews yet!"
    end
  end

  def reviews_count
    reviews.count
  end

  # selects all beers that have been reviewed at least once
  def self.reviewed_beers
    Beer.all.select do |beer|
      beer.reviews_count > 0
    end
  end

  # orders all reviewed_beers according to their average_rating
  def self.order_by_avg_rating
    reviewed_beers.sort_by do |beer|
      beer.average_rating
    end
  end

  # orders all beers according to their reviews_count
  def self.order_by_review_count
    all.sort_by do |beer|
      beer.reviews_count
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

  # selects the beer with the highest reviews_count from the beers ordered
  # by their reviews_count
  def self.most_reviewed
    order_by_review_count[-1]
  end
end
