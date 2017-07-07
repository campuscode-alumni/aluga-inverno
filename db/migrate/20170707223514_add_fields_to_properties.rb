class AddFieldsToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :picture, :string
    add_column :properties, :owner, :string
    add_column :properties, :email, :string
    add_column :properties, :phone, :string
  end
end
