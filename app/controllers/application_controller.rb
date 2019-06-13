class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  after_action :store_action #

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar, :avatar_cache])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar, :avatar_cache])
  end

  def store_action
  return unless request.get?
  if (request.path != "/users/sign_in" &&
      request.path != "/users/sign_up" &&
      request.path != "/users/password/new" &&
      request.path != "/users/password/edit" &&
      request.path != "/users/confirmation" &&
      request.path != "/users/sign_out" &&
      !request.xhr?) # don't store ajax calls
    store_location_for(:user, request.fullpath)
  end

# app/controllers/application_controller.rb

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  end
  # def after_sign_in_path_for(resource)
  # request.env['omniauth.origin'] || stored_location_for(resource) || root_url
  # end
end
