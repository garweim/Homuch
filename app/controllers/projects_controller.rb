class ProjectsController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    #@projects = Project.all
    @projects = Project.where.not(latitude: nil, longitude: nil)
    map_all_projects
  end

  def new
    @project = Project.new(session_projects_params) #Prefill based on session info
    perform_simple_estimate
  end

  def create
    # check if user signed in
    if current_user
      create_project
      # check if project is created
      if @project.errors.none?
        if params[:pictures]
          params[:pictures]['photo'].each do |a|
            @picture = @project.pictures.create!(photo: a)
          end
        end
        redirect_to project_path(@project)
      else
        render :new
      end
    else
      save_project_data_in_session
      perform_simple_estimate
      render 'projects/simple_estimate'
    end
  end

  def show
    find_id
    perform_detailed_estimate
    map_single_project
    @pictures = @project.pictures
  end

  # def update
  #   @project.update(projects_params)
  # end
  def update
    @project.update(projects_params)
  end


  # def destroy
  #   @project.destroy
  # end

  private

  def projects_params
    params.require(:project)
      .permit(:street_and_nr, :surface, :nr_of_bedrooms, :nr_of_bathrooms,
              :category, :garage, :heating, :electricity, :kitchen, :sanitation,
              :zipcode, :name, :state, pictures_attributes: [:id, :project_id, :photo])
  end

  def find_id
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
    @simple_estimate = ::SimpleEstimate.new.market_price(session_projects_params)
  end

  def perform_detailed_estimate
    @detailed_estimate = ::DetailedEstimate.new.call(@project)
    # @detailed_estimate = ::DetailedEstimate.new.call(@project)
  end

  def map_single_project
    @markers = [
      {
        lat: @project.latitude,
        lng: @project.longitude
      }
    ]
  end

  def map_all_projects
    @markers = @projects.map do |project|
      {
        lat: project.latitude,
        lng: project.longitude
      }
    end
  end
end
