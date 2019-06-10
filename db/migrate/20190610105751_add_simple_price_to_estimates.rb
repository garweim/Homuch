class AddSimplePriceToEstimates < ActiveRecord::Migration[5.2]
  def change
    add_column :estimates, :simple_price, :integer
  end
end
