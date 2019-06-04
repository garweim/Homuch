class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      t.string :name
      t.string :address
      t.integer :surface
      t.integer :nr_of_bedrooms
      t.string :type_asset
      t.integer :nr_of_bathrooms
      t.string :state
      t.integer :garage
      t.boolean :terrace
      t.boolean :heating
      t.boolean :electricity
      t.boolean :kitchen
      t.boolean :sanitation
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
