class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :bio, :location

  def show
    @user = current_user
    case step
    when :bio
      authorize @user
    end
    render_wizard
  end
end
