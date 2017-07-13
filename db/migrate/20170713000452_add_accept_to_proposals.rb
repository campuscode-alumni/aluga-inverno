class AddAcceptToProposals < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :accept, :int, default: 0
  end
end
