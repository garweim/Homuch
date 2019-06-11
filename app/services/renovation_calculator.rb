class RenovationCalculator
  def initialize(project)
    @project = project
  end

  attr_reader :project
  # private

  def total_price
    electricity_price + heating_price + sanitation_price + kitchen_price
  end

  def electricity_price
    project.electricity ? @project.surface * 65 : 0
  end

  def heating_price
    project.heating ? @project.surface * 130 : 0
  end

  def sanitation_price
    project.sanitation ? @project.nr_of_bathrooms * 3000 : 0
  end

  def kitchen_price
    project.kitchen ? 7000 : 0
  end
end
