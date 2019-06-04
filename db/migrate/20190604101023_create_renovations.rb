class CreateRenovations < ActiveRecord::Migration[5.2]
  def change
    create_table :renovations do |t|
      t.string :type
      t.integer :price_per_sqm

      t.timestamps
    end
  end
end
