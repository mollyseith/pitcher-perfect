class Brewery < ApplicationRecord
  has_many :beers
  has_many :reviews, through: :beers
  has_many :users, through: :reviews

  # selects all of a brewery's beers which have an associated review
  def reviewed_beers
    beers.select do |beer|
      beer.reviews_count > 0
    end
  end

  # counts the total number of reviews associated with a brewery's beers
  def reviewed_beers_count
    review_count = beers.inject(0) do |total, beer|
      total + beer.reviews_count
    end
    review_count
  end

  # calculates the average_rating for all of a brewery's beers which have been
  # reviewed
  def avg_beer_rating
    total = reviewed_beers.inject(0) do |s, b|
      s + b.average_rating
    end
    total / reviewed_beers.count
  end

  # sorts a brewery's beers by their average_rating
  def order_beers_by_avg_rating
    reviewed_beers.sort_by do |beer|
      beer.average_rating
    end
  end

  # selects the beer with the highest average_rating from the beers ordered by
  # their average rating
  def best_beer
    order_beers_by_avg_rating[-1]
  end

  # selects the beer with the lowest average_rating from the beers ordered by
  # their average rating
  def worst_beer
    order_beers_by_avg_rating[0]
  end

  # sorts all breweries according to the average_rating for all of a brewery's
  # beers
  def self.order_by_avg_beer_rating
    all.sort_by do |b|
      b.avg_beer_rating
    end
  end

  # selects the brewery with the highest average_beer_rating from the breweries
  # ordered by their average beer rating
  def self.best_brewery
    order_by_avg_beer_rating[-1]
  end

  # selects the brewery with the lowest average_beer_rating from the breweries
  # ordered by their average beer rating
  def self.worst_brewery
    order_by_avg_beer_rating[0]
  end
end
