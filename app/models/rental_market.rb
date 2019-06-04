class RentalMarket < ApplicationRecord
  validates :address, :surface, :nr_of_bedrooms,
            :nr_of_bathrooms, :price,
            presence: true
end
