class CreateEstimates < ActiveRecord::Migration[5.2]
  def change
    create_table :estimates do |t|
      t.integer :market_price
      t.integer :rental_price
      t.integer :roi_rate
      t.integer :roi_price
      t.integer :loan_payment
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
