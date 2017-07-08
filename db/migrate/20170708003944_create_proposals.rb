class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.date :start_date
      t.date :end_date
      t.decimal :total_amount
      t.integer :total_guests
      t.string :rent_purpose
      t.string :name
      t.string :email
      t.string :cpf
      t.string :phone
      t.text :extra_info
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
