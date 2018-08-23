class User < ApplicationRecord
  has_many :reviews
  has_many :beers, through: :reviews
  has_many :breweries, through: :beers

  validates_presence_of :name, :birthdate
  validate :able_to_drink?

  has_secure_password

  extend ReviewInfoable::ClassMethods
  include ReviewInfoable::InstanceMethods

  # Uses current day to return a user's age as an integer
  def current_age
    age = Date.today.year - birthdate.year
    age -= 1 if Date.today < birthdate + age.years
    age
  end

  def able_to_drink?
    if !(current_age >= 21)
      errors.add(:birthdate, 'must be at least 21 years old.')
    end
  end

  def unique_beers_reviewed
    beers.uniq
  end
end
