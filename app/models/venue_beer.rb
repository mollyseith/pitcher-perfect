class VenueBeer < ApplicationRecord
  belongs_to :venue
  belongs_to :beer
end
