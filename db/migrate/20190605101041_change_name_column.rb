class ChangeNameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :sell_markets, :address, :street_and_nr
  end
end
