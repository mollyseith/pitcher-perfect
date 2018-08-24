class Brewery < ApplicationRecord
  has_many :beers
  has_many :reviews, through: :beers
  has_many :venues, through: :beers
  has_many :styles, through: :beers
  has_many :users, through: :reviews

  extend BeerInfoable::ClassMethods
  include BeerInfoable::InstanceMethods
end
