class Estimate < ApplicationRecord
  belongs_to :project
  validates :market_price, numericality: { greater_than: 50_000 }

  def registration_fees
    (simple_price * 0.15).to_i
  end

  def credit_cost(rate_in_percentage, years, capital = self.market_price)
    rate_in_percentage = rate_in_percentage / 100
    m = (capital * (rate_in_percentage / 12))
    p = 1 - (1 + (rate_in_percentage / 12))**-years
    return (m / p)
  end
end
# estimate = project.estimates.last
# estimate.spaces_on(market_price)
