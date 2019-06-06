class RenovationsController < ApplicationController
  def index
    @renovation = Renovation.all
  end

  def new
    @renovation = Renovation.new
  end

  def create
    @renovation = Renovation.new(renovations_params)
    @renovation.project = Project.find(params[:project_id])
    @renovation.save
  end

  def show
  end

  def update
    @renovation = Renovation.find(params[:id])
    @renovation.update(renovation_params)
  end

  def destroy
    @renovation = Renovation.find(params[:id])
    @renovation.destroy
  end

  private

  def renovation_params
    params.require(:renovation).permit(:category, :price_per_unit, :quantity)
  end
end
