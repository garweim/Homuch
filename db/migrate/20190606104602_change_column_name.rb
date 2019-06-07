class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :renovations, :type, :category
  end
end
