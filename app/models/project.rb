class Project < ApplicationRecord
  STATE = %w(good bad average)
  belongs_to :user
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures
  has_many :renovations, dependent: :destroy
  has_many :estimates, dependent: :destroy

  # validates :name, :zipcode, :surface, :nr_of_bedrooms,
  #           :category, :nr_of_bathrooms, :state, :garage,
  #           presence: true

  # validates :state, inclusion: { in: STATE }
  # validates :heating, :electricity, :kitchen, :sanitation, inclusion: { in: [true, false] }

  geocoded_by :street_and_nr
  after_validation :geocode, if: :will_save_change_to_street_and_nr?
end
