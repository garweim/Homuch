class AddZipcodeToAssets < ActiveRecord::Migration[5.2]
  def change
    add_column :assets, :zipcode, :integer
  end
end
