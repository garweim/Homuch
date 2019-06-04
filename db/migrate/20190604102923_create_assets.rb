class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      t.string :name
      t.string :address
      t.integer :surface
      t.integer :nr_of_bedrooms
      t.string :type
      t.integer :nr_of_bathrooms
      t.string :state
      t.integer :garage
      t.string :electricity
      t.string :heating
      t.string :kitchen
      t.string :bathroom
      t.boolean :terrace
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
