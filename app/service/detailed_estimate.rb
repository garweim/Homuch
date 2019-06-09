class DetailedEstimate
  def call(params)
    @params = params
    return unless market_price_estimate

    total_estimate
  end

  private

  attr_reader :params

  def total_estimate
    (market_price_estimate * registration_fees) - total_price
  end

  def registration_fees
    market_price_estimate * 0.15
  end

  def market_price_estimate
    @market_price ||= SimpleEstimate.new.market_price(params)
    # SimpleEstimate.new.market_price(params)
  end

  def total_price
    @total_price ||= RenovationCalculator.new.call(params)
  end
end
# DetailedEstimate.new.call_detailed(Project.last)
