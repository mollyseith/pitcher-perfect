class Beer < ApplicationRecord
  belongs_to :brewery
  has_many :reviews
  has_many :users, through: :reviews
  has_many :venue_beers
  has_many :venues, through: :venue_beers
end
