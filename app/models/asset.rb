class Asset < ApplicationRecord
  belongs_to :user
  has_many :pictures, dependent: :destroy
  has_many :renovations, dependent: :destroy
  has_many :estimates, dependent: :destroy
end
