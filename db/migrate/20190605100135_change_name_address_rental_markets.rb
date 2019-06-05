class ChangeNameAddressRentalMarkets < ActiveRecord::Migration[5.2]
  def change
    rename_column :rental_markets, :address, :street_and_nr
  end
end
