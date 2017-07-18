class Property < ApplicationRecord
  has_attached_file :photo
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  has_many :proposals
  has_many :prices
  has_many :reviews

  belongs_to :owner
  validates :property_type, :maximum_guests, :minimum_rent, :maximum_rent,
   :rent_purpose, :property_location, :description, :rules, :daily_rate,
   :picture, presence: true

  def has_accepted_proposal?(user)
    return false if user.nil?
    proposals.where(user: user, accept:1).any?
  end

  def has_review_from?(user)
    reviews.where(user: user).any?
  end
end
