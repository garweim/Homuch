class Calculation
  def market_price(params)
    filtered_array = SellMarket.where(zipcode: params[:zipcode], surface: surface_range(params), nr_of_bedrooms: params[:nr_of_bedrooms], nr_of_bathrooms: params[:nr_of_bathrooms])

    return unless filtered_array.present?
    price_per_sqm = []
    filtered_array.each do |x|
      price_per_sqm << x.price / x.surface
    end

    sum = 0
    price_per_sqm.each do |x|
      sum += x
    end

    sum / filtered_array.count
  end

  def surface_range(params)
    surface = params[:surface].to_i
    surface-20 ..surface+20
  end
end

