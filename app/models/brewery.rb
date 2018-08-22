class Brewery < ApplicationRecord
  has_many :beers
  has_many :reviews, through: :beers
  has_many :users, through: :reviews

  def reviewed_beers
    beers.select do |beer|
      beer.reviews_count > 0
    end
  end

  def reviewed_beers_count
    review_count = beers.inject(0) do |total, beer|
      total + beer.reviews_count
    end
    review_count
  end

  def avg_beer_rating
    total = reviewed_beers.inject(0) do |s, b|
      s + b.average_rating
    end
    total / reviewed_beers.count
  end

  def order_beers_by_avg_rating
    reviewed_beers.sort_by do |beer|
      beer.average_rating
    end
  end

  def best_beer
    order_beers_by_avg_rating[-1]
  end

  def worst_beer
    order_beers_by_avg_rating[0]
  end

  def self.order_by_avg_beer_rating
    all.sort_by do |b|
      b.avg_beer_rating
    end
  end

  def self.best_brewery
    order_by_avg_beer_rating[-1]
  end

  def self.worst_brewery
    order_by_avg_beer_rating[0]
  end
end
