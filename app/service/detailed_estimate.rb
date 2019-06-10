class DetailedEstimate
  def call(project)
    @project = project
    return unless market_price_estimate
    total_estimate
  end

  # private

  attr_reader :project

  def total_estimate
    (market_price_estimate + registration_fees) - renovation_price
  end

  def registration_fees
    market_price_estimate * 0.15
  end

  def market_price_estimate
    @market_price ||= SimpleEstimate.new.market_price(@project)
    # SimpleEstimate.new.market_price(project)
  end

  def renovation_price
    @renovation_price ||= RenovationCalculator.new(@project).total_price
  end
end
# DetailedEstimate.new.call_detailed(Project.last)
