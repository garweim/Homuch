class DetailedEstimate
  def call_detailed(params)
    @params = params
    total_price
  end

  private
  attr_reader :params

  def total_estimate
    electricity_price + heating_price + sanitation_price + kitchen_price
  end

  def registration_fees
    market_price * 1.15
  end
end
