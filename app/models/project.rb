class Project < ApplicationRecord
  STATE = %w(good bad average)
  belongs_to :user
  has_many :pictures, dependent: :destroy
  has_many :renovations, dependent: :destroy
  has_many :estimates, dependent: :destroy
  validates :name, :zipcode, :surface, :nr_of_bedrooms,
            :category, :nr_of_bathrooms, :state, :garage,
            :heating, :electricity, :kitchen, :sanitation,
            presence: true
  validates :state, inclusion: { in: STATE }
end
