class ProjectsController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new(session_projects_params) #Prefill based on session info
    # authorize @Projects
    session_projects_params
    perform_simple_estimate
  end

  def create
    if current_user
      create_project
      # METHOD that redirects to COMPLEX estimation
    else
      save_project_data_in_session
      perform_simple_estimate
      render 'projects/simple_estimate'
    end
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

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def projects_params
    params
      .require(:project)
      .permit(:street_and_nr, :surface, :nr_of_bedrooms, :nr_of_bathrooms,
              :category, :garage, :heating, :electricity, :kitchen, :sanitation,
              :zipcode, :name, :state)
  end

  def session_projects_params
    session.to_hash.symbolize_keys.slice(*session_saved_keys)
  end

  def session_saved_keys
    [ :zipcode, :surface, :nr_of_bedrooms, :nr_of_bathrooms, :category]
  end

   def perform_simple_estimate
    @simple_estimate = ::Calculation.new.market_price(session_projects_params)
   end

  # def authorize_offering
  #   authorize @offering
  # end

  # def find_id
  #   @offering = Offering.find(params[:id])
  #   authorize @offering
  # end
end
