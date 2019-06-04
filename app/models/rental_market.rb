class RentalMarket < ApplicationRecord
  validates :address, presence: true
  validates :surface, presence: true
  validates :nr_of_bedrooms, presence: true
  validates :nr_of_bathrooms, presence: true
  validates :price, presence: true
end
