class Proposal < ApplicationRecord
  belongs_to :property
  belongs_to :user

  validate :validate_disponibility
  validates :start_date, presence: true

  def validate_disponibility
    proposals =  Proposal.where(property: property, start_date: start_date, end_date: end_date, accept: 1)
    if proposals.any?
      errors.add(:base, 'Este periodo esta indisponivel')
    end
  end

  def calculate_days
    (end_date - start_date)+1
  end

end
