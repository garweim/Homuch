class AddZipcodeToRentalMarkets < ActiveRecord::Migration[5.2]
  def change
    add_column :rental_markets, :zipcode, :integer
  end
end
