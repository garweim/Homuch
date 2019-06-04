class AddAssetToPicture < ActiveRecord::Migration[5.2]
  def change
    t.references :asset, foreign_key: true
  end
end
