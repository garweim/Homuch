class RoiInvestmentCalculator
  def initialize(project)
    @project = project
  end

  attr_reader :project

  def investment_estimate(desired_roi)
    @desired_roi = desired_roi
    @rental_market_price = rental_market_price
    ((@rental_market_price * 12) / @desired_roi) * @project.surface
  end

  def roi_estimate
    @rental_market_price = rental_market_price
    @total_invest = (@project.simple_price * 1.15) + renovation_price
    (@rental_market_price * 12) / @total_invest
  end

  def rental_market_price
    filtered_array = RentalMarket.where(
      zipcode: @project.zipcode,
      surface: @project.surface_approx,
      nr_of_bedrooms: @project.nr_of_bedrooms,
      nr_of_bathrooms: @project.nr_of_bathrooms
    )
    price_per_sqm = filtered_array.map do |house|
      house.price / house.surface
    end
    (price_per_sqm.sum / filtered_array.count) * @project.surface
  end

  def renovation_price
    @renovation_price ||= RenovationCalculator.new(@project).total_price
  end
end
