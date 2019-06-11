class Estimate < ApplicationRecord
  belongs_to :project
  validates :market_price, numericality: { greater_than: 50_000 }

  def registration_fees
    (simple_price * 0.15).to_i
  end

  def credit_cost(rate, years)
    m = (market_price * (rate / 12))
    p = 1 - (1 + (rate / 12))**-years
    return (m / p)
  end
end
