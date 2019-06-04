class EstimatesController < ApplicationController
  def index
    @estimates = Estimate.all
  end

  def show
    @estimate = Estimate.find(params[:id])
  end

  def new

  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
