class ProjectsController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    # @projects = Project.all
    @projects = Project.where.not(latitude: nil, longitude: nil)
    map_all_projects
  end

  def new
    @project = Project.new(session_projects_params) #Prefill based on session info
    perform_simple_estimate
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
      # @estimate = @project.estimates.create(estimate_params
      # check if project is created

      if params[:pictures]
        params[:pictures]['photo'].each do |a|
          @picture = @project.pictures.create!(photo: a)
        end
      end
      # if the project does not have any errors,
      # and the estimate got saved properly
      # then we redirect
      if @project.errors.none? && @estimate.save
        redirect_to project_path(@project)

      if @project.save
        @project.estimates.create(
          market_price: @detailed_estimate,
          simple_price: @simple_estimate)
        if params[:pictures]
          params[:pictures]['photo'].each do |a|
            @picture = @project.pictures.create!(photo: a)
          end
        end
        redirect_to project_path(@project) #&& @estimate.errors.none
>>>>>>> master
      else
        # we need to remove the project from the DB
        # we can still use the @project in the form in the new page
        # but the record gets destroyed, so we dont recreate it upon second save
        @project.destroy
        render :new
      end
<<<<<<< HEAD

      #render :new if @simple_estimate == 0


=======
>>>>>>> master
    else
      save_project_data_in_session
      perform_simple_estimate
      render 'projects/simple_estimate'
    end
  end

  def show
    find_id
    perform_simple_estimate
    perform_detailed_estimate
    @renovation_details = ::RenovationCalculator.new(@project)
    map_single_project
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
    @project = Project.find(params[:id])
    @project.edit
  end


  def destroy
    @project = Projectt.find(params[:id])
    @project.destroy
  end

  def new_loan
    @project = Project.find(params[:id])
    # instead of this controller rendering a view;
    # it will render a javascript template
    #  -> new_loan.js.erb
    @loan_rate = params[:loan_calculation][:rate].to_f
    @loan_years = params[:loan_calculation][:years].to_i
    @estimate = @project.estimates.last
    @credit_cost = @estimate.credit_cost(@loan_rate, @loan_years).round(1)
    #@monthly_payment = (@estimate + @credit_cost) / (@loan_years * 12)
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
    @simple_estimate = (::SimpleEstimate.new.market_price(session_projects_params)).to_i
  end

  def perform_detailed_estimate
    @detailed_estimate = (::DetailedEstimate.new.call(@project)).to_i
    # @detailed_estimate = ::DetailedEstimate.new.call(@create_project)
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
        lng: project.longitude,
        infoWindow: render_to_string(partial: "/projects/map_box", locals: { project: project })
      }
    end
  end
end
