class AddCpfToOwner < ActiveRecord::Migration[5.1]
  def change
    add_column :owners, :cpf, :string
  end
end
