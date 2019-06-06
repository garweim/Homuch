class RenovationCalculator
  def call(params)
    @params = params
    total_price
  end

  private

  attr_reader :params

  def total_price
    electricity_price + heating_price + sanitation_price + kitchen_price
  end

  def electricity_price
    electricity? ? surface * 65 : 0
  end

  def heating_price
    heating? ? surface * 130 : 0
  end

  def sanitation_price
    sanitation? ? nr_of_bathrooms * 3000 : 0
  end

  def kitchen_price
    kitchen? ? 7000 : 0
  end

  def electricity?
    params[:electricity]
  end

  def heating?
    params[:heating]
  end

  def sanitation?
    params[:sanitation]
  end

  def kitchen?
    params[:kitchen]
  end

  def surface
    params[:surface]
  end

  def nr_of_bathrooms
    params[:nr_of_bathrooms]
  end
end
