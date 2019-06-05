class AddZipcodeToSellMarket < ActiveRecord::Migration[5.2]
  def change
    add_column :sell_markets, :zipcode, :integer
  end
end
