class Amenity < ApplicationRecord
  validates :name, presence: :true
  has_one_attached :icon

  has_many :property_amenities, dependent: :destroy
  has_many :propertiess, through: :property_amenities, source: :property, dependent: :destroy
end
