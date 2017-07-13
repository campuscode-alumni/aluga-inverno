class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.float :total_amount

      t.timestamps
    end
  end
end
