class Calculation
  def market_price(zip_code, sqm, bed, bath)
    filtered_array = SellMarket.where(zip_code: zip_code, surface: sqm-20 ..sqm+20, nr_of_bedrooms: bed, nr_of_bathrooms: bath)

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

puts market_price(1000, 200, 3, 2)

