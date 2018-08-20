class User < ApplicationRecord
  has_many :reviews
  has_many :beers, through: :reviews
  has_many :breweries, through: :beers

  def current_age
    Date.today.year - birthdate.year
  end
end
