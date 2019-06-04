class Asset < ApplicationRecord
  belongs_to :user
  has_many :pictures, dependent: :destroy
  has_many :renovations, dependent: :destroy
  has_many :estimates, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :surface, presence: true
  validates :nr_of_bedrooms, presence: true
  validates :type_asset, presence: true
  validates :nr_of_bathrooms, presence: true
  validates :state, presence: true
  validates :garage, presence: true
  validates :heating, presence: true
  validates :electricity, presence: true
  validates :kitchen, presence: true
  validates :sanitation, presence: true

end
