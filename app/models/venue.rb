class Venue < ApplicationRecord
  has_many :venue_beers
  has_many :beers, through: :venue_beers

  extend BeerInfoable::ClassMethods
  include BeerInfoable::InstanceMethods
end
