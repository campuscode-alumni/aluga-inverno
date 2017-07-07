class AddRulesToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :rules, :string
  end
end
