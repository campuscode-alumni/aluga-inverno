class AddPropertyToPrice < ActiveRecord::Migration[5.1]
  def change
    add_reference :prices, :property, foreign_key: true
  end
end
