class AssetsController < ApplicationController
  # before_action :find_id, only: [:show, :edit, :update, :destroy]
  # skip_before_action :authenticate_user!, only: :index
  def index
    @assets = Asset.all
  end

  def new
    @asset = Asset.new(session.to_hash.symbolize_keys.slice(*session_saved_keys)) #Prefill based on session info
    # authorize @Assets
  end

  def create
    if current_user
      create_asset
      # METHOD that redirects to COMPLEX estimation
    else
      save_asset_data_in_session
      # Method that redirects to SIMPLE estimation
    end
  end

  def create_asset
    @asset = Asset.create(asset_params.merge(user: current_user))
  end

  def save_asset_data_in_session
    asset_params.each do |key, val|
      session[key] = val
    end
    @asset = OpenStruct.new(asset_params)
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

  def assets_params
    params.require(:asset).permit(:address, :surface, :nr_of_bedrooms, :nr_of_bathrooms, :type_asset, :name, :state,
                                  :garage, :terrace, :heating, :electricity, :kitchen, :sanitation, :user_id)
  end

  def session_saved_keys
    [ :address, :surface, :nr_of_bedrooms, :nr_of_bathrooms, :type_asset ]
  end

  # def perform_analysis
  #   @roi = MyObject.new.call(asset)
  # end

  # def authorize_offering
  #   authorize @offering
  # end

  # def find_id
  #   @offering = Offering.find(params[:id])
  #   authorize @offering
  # end
end
