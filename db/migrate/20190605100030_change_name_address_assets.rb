class ChangeNameAddressAssets < ActiveRecord::Migration[5.2]
  def change
    rename_column :assets, :address, :street_and_nr
  end
end
