class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :new_loan, :new_investment]
  skip_before_action :authenticate_user!, only: [:new, :create]

  def index
    # @projects = Project.all
    @projects = Project.where.not(latitude: nil, longitude: nil)
    @markers = map_all_projects(@projects)
    # @detailed_estimate = perform_detailed_estimate
  end

  def new
    @project = Project.new(session_projects_params) #Prefill based on session info
    # perform_simple_estimate
    # if @simple_estimate == 0
    #  render :new
    # end
  end

  def create
    if current_user
      create_project
      @detailed_estimate = perform_detailed_estimate
      @simple_estimate = perform_simple_estimate
      # we create a estimate for this project
      # save return in estimate table ->
      @estimate = Estimate.new(
        market_price: @detailed_estimate,
        simple_price: @simple_estimate,
        project: @project
      )
      if @project.save && @estimate.save
        # @project.estimates.create(
        #   market_price: @detailed_estimate,
        #   simple_price: @simple_estimate)
        if params[:pictures]
          params[:pictures]['photo'].each do |a|
            @picture = @project.pictures.create!(photo: a)
          end
        end
        redirect_to project_path(@project) #&& @estimate.errors.none

      else
        # we need to remove the project from the DB
        # we can still use the @project in the form in the new page
        # but the record gets destroyed, so we dont recreate it upon second save
        @project.destroy
        render :new
      end
    else
      save_project_data_in_session
      @simple_estimate = perform_simple_estimate
      render 'projects/simple_estimate'
    end
  end

  def show
    @simple_estimate = perform_simple_estimate
    @detailed_estimate = perform_detailed_estimate
    @renovation_details = ::RenovationCalculator.new(@project)
    @roi_estimate = ::RoiInvestmentCalculator.new(@project).roi_estimate
    # @last_estimate = @project.estimates.last
    @markers = map_single_project
    @pictures = @project.pictures
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@project.name}",
          template: "projects/show.html.erb",
          layout: "pdf.html"
      end
    end
  end

  def edit
  end

  def update
    if @project.update(projects_params)
      if params[:pictures]
          params[:pictures]['photo'].each do |a|
            @picture = @project.pictures.create!(photo: a)
          end
      end
      redirect_to project_path
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  def new_loan
    # instead of this controller rendering a view;
    # it will render a javascript template
    #  -> new_loan.js.erb
    @loan_rate = params[:loan_calculation][:rate].to_f
    @loan_years = params[:loan_calculation][:years].to_i
    @estimate = @project.estimates.last
    @credit_cost = @estimate.credit_cost(@loan_rate, @loan_years).round(1)
    #@monthly_payment = (@estimate + @credit_cost) / (@loan_years * 12)
  end

  def new_investment
    # instead of this controller rendering a view;
    # it will render a javascript template
    #  -> new_investment.js.erb
    @roi_service = ::RoiInvestmentCalculator.new(@project)
    @desired_rate = params[:investment_calculation][:rate].to_f
    @total_investment = @roi_service.investment_estimate(@desired_rate)
  end

  private

  def projects_params
    params.require(:project)
      .permit(:street_and_nr, :surface, :nr_of_bedrooms, :nr_of_bathrooms,
              :category, :garage, :heating, :electricity, :kitchen, :sanitation,
              :zipcode, :name, :state, pictures_attributes: [:id, :project_id, :photo])
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def session_projects_params
    session.to_hash.symbolize_keys.slice(*session_saved_keys)
  end

  def session_saved_keys
    [:zipcode, :surface, :nr_of_bedrooms, :nr_of_bathrooms, :category]
  end

  def create_project
    @project = Project.create(projects_params.merge(user: current_user))
  end

  def save_project_data_in_session
    projects_params.each do |key, val|
      session[key] = val
    end
    @project = OpenStruct.new(projects_params)
  end

  def perform_simple_estimate
    ::SimpleEstimate.new.market_price(session_projects_params)
  end

  def perform_detailed_estimate
    ::DetailedEstimate.new.call(@project)
    # @detailed_estimate = ::DetailedEstimate.new.call(@create_project)
  end

  def map_single_project
    [
      {
        lat: @project.latitude,
        lng: @project.longitude
      }
    ]
  end

  def map_all_projects(projects)
    projects.map do |project|
      {
        lat: project.latitude,
        lng: project.longitude,
        infoWindow: render_to_string(partial: "/projects/map_box", locals: { project: project })
      }
    end
  end
end
