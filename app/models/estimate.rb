class Estimate < ApplicationRecord
  belongs_to :project

  def registration_fees
    (simple_price * 0.15).to_i
  end
end


