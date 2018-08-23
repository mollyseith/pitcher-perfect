class Review < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  def brewery
    beer.brewery
  end

  def self.five_stars
    where ("rating == 5")
  end

  def beer_style
    beer.style
  end
end
