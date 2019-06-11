class Calculation
  def market_price(zipcode, sqm, bed, bath)
    filtered_array = SellMarket.where(zipcode: zipcode, surface: sqm-20 ..sqm+20, nr_of_bedrooms: bed, nr_of_bathrooms: bath)

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
end

