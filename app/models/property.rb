class Property < ApplicationRecord
  validates :property_type, :maximum_guests, :minimum_rent, :maximum_rent,
   :rent_purpose, :property_location, :description, :rules, :daily_rate,
   :picture, :owner, :email, :phone, presence: true
end
