class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :profile]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :bio, :location, :bio, :price])
  end
end
