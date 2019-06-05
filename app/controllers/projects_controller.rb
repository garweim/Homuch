class ProjectsController < ApplicationController
   before_action :find_id, only: [:show, :edit, :update, :destroy]
   skip_before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new(session.to_hash.symbolize_keys.slice(*session_saved_keys)) #Prefill based on session info
    # authorize @Projects
  end

  def create
    if current_user
      create_project
      # METHOD that redirects to COMPLEX estimation
    else
      save_project_data_in_session
      # Method that redirects to SIMPLE estimation
    end
    redirect_to new_project_path
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
    params.require(:project).permit(:address, :surface, :nr_of_bedrooms, :nr_of_bathrooms, :category)
  end

  def session_saved_keys
    [:address, :surface, :nr_of_bedrooms, :nr_of_bathrooms, :category]
  end

  # def perform_analysis
  #   @roi = MyObject.new.call(project)
  # end

  # def authorize_offering
  #   authorize @offering
  # end

  # def find_id
  #   @offering = Offering.find(params[:id])
  #   authorize @offering
  # end
end
