class Style < ApplicationRecord
  has_many :beers

  extend BeerInfoable::ClassMethods
  include BeerInfoable::InstanceMethods
end
