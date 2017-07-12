class Proposal < ApplicationRecord
  belongs_to :property

  def calculate_days
    (end_date - start_date)+1
  end

end
