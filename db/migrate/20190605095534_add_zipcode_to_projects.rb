class AddZipcodeToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :zipcode, :integer
  end
end
