class User < ApplicationRecord
  has_many :reviews
  has_many :beers, through: :reviews
  has_many :breweries, through: :beers

  # Uses current day to return a user's age as an integer
  def current_age
    Date.today.year - birthdate.year
  end
end
