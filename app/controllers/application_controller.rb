class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :profile, :autocomplete]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :last_seen_at, if: -> {user_signed_in? && (current_user.last_seen_at.nil? ||current_user.last_seen_at < 5.minutes.ago) }
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def last_seen_at
    current_user.update_attribute(:last_seen_at, Time.current)
  end

  protected

   def after_sign_in_path_for(resource)
      if params[:controller] == "devise/registrations"
        after_signup_path(Wicked::FIRST_STEP)
      else
        dashboard_path
      end
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :bio, :location, :bio, :price, :language])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :surname, :language, :bio, :location, :bio, :price, :photo])
  end
end

def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
end
