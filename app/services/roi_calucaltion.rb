class RoiCalculation
  def market_price(zipcode, sqm, bed, bath)
    filtered_array = RentMarket.where(zipcode: zipcode, surface: sqm-20 ..sqm+20, nr_of_bedrooms: bed, nr_of_bathrooms: bath)
    price_per_sqm = []
    filtered_array.each do |x|
      price_per_sqm << x.price/x.surface
    end
    sum = 0
    price_per_sqm.each do |x|
    sum += x
     end
    sum/filtered_array.count
  end

  def roi_estimate
    @market_price = market_price
    @total_invest = total_invest
    (@market_price * 12) / @total_invest
  end

  def total_invest
    market_price_estimate * 1.15 + renovation_price
  end

  def market_price_estimate
    @market_price ||= SimpleEstimate.new.market_price(@project)
    # SimpleEstimate.new.market_price(project)
  end

  def renovation_price
    @renovation_price ||= RenovationCalculator.new(@project).total_price
  end
end
