class CreateSellMarkets < ActiveRecord::Migration[5.2]
  def change
    create_table :sell_markets do |t|
      t.string :address
      t.integer :surface
      t.integer :nr_of_bedrooms
      t.integer :nr_of_bathrooms
      t.integer :price

      t.timestamps
    end
  end
end
