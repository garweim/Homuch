class ChangeNameAddressProjects < ActiveRecord::Migration[5.2]
  def change
    rename_column :projects, :address, :street_and_nr
  end
end
