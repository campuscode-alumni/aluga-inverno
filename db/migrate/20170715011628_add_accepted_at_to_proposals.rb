class AddAcceptedAtToProposals < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :accepted_at, :date
  end
end
