class CreditCalculation
  def credit_cost(loan, rate, years)
    m = (loan * (rate / 12))
    p = 1 - (1 + (rate / 12)) ** ( -years)
    return m / p
  end
  # puts credit_cost(200000, 0.045, 20)
end
