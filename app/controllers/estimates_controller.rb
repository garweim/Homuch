class EstimatesController < ApplicationController
  def index
    @estimates = Estimate.all
  end

  def show
    @estimate = Estimate.find(params[:id])
  end

  def new
    # projects/project_id/estimates/new
    @estimate = Estimate.new(params[:project_id]) #find the project  based on pr_id
    @detailed_estimate = perfom_detailed_estimate # call estimate service again
    @estimate.save!
    redirect to project_path(@project) if @estimate.errors.none?#link it to project

    # save the estimate
  end

  def create
  end

  private

  def estimate_params
    [:market_price, :rental_price, :roi_rate, :roi_price, :loan_payment, :project_id]
  end

  def perform_detailed_estimate
    ::DetailedEstimate.new.call(@project)
  end
end
