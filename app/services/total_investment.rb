class Totalinvestment
  def call(project, desired_roi)
    @project = project
    @desired_roi = desired_roi
  return unless market_price_estimate
    investment_estimate
  end
  # private

  attr_reader :project

  def market_price(zipcode, sqm, bed, bath)
    filtered_array = RentalMarket.where(zipcode: zipcode, surface: sqm-20 ..sqm+20, nr_of_bedrooms: bed, nr_of_bathrooms: bath)
    price_per_sqm = []
    filtered_array.each do |x|
      price_per_sqm << x.price/x.surface
    end
    sum = 0
    price_per_sqm.each do |x|
    sum += x
     end
    (sum/filtered_array.count) * sqm
  end

  def investment_estimate
    @rent_market_price = market_price(@project.zipcode,
                                      @project.surface,
                                      @project.nr_of_bedrooms,
                                      @project.nr_of_bathrooms)
    # @total_invest = (market_price_estimate * 1.15) + renovation_price
    (@rent_market_price * 12) / @desired_roi
  end

  def market_price_estimate
    @market_price ||= SimpleEstimate.new.market_price(@project)
    # SimpleEstimate.new.market_price(project)
  end

  def renovation_price
    @renovation_price ||= RenovationCalculator.new(@project).total_price
  end

  def total_invest
    market_price_estimate(@project) * 1.15 + renovation_price(project)
  end

  # def invest_estimate(project, desired_roi)
  #   @market_price = market_price(project.zipcode,
  #                                project.surface,
  #                                project.bed,
  #                                project.nr_of_bathrooms)
  #   (@market_price * 12) / desired_roi
  # end
end

