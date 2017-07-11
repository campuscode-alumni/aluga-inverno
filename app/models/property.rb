class Property < ApplicationRecord

  has_many :proposals

  belongs_to :owner
  validates :property_type, :maximum_guests, :minimum_rent, :maximum_rent,
   :rent_purpose, :property_location, :description, :rules, :daily_rate,
   :picture, presence: true

end
