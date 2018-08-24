class Review < ApplicationRecord
  belongs_to :user
  belongs_to :beer
  has_one :brewery, through: :beer
  has_one :style, through: :beer
  has_many :venues, through: :beer

  def self.five_stars
    where ("rating == 5")
  end
end
