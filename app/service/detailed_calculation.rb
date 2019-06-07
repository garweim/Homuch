
class Detailed_Calculation
  def renovation_price
  heating = true
  electricity = false
  kitchen = true
  sanitation = true
  surface = 200

    if heating == true
      heating_cost = surface * 100
    else
      heating_cost = 0
    end

    if electricity == true
      electricity_cost = surface * 75
    else
      electricity_cost = 0
    end

    if kitchen == true
      kitchen_cost = 8000
    else
      kitchen_cost = 0
    end

    if sanitation == true
      sanitation_cost = 7000
    else
      sanitation_cost = 0
    end

  return sum = heating_cost + electricity_cost + kitchen_cost + sanitation_cost

  end
end

