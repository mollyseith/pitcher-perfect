class Venue < ApplicationRecord
  has_many :venue_beers
  has_many :beers, through: :venue_beers
  has_many :breweries, through: :beers
  has_many :users, through: :beers
  has_many :reviews, through: :beers
  has_many :styles, through: :beers

  extend BeerInfoable::ClassMethods
  include BeerInfoable::InstanceMethods
end
