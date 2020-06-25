class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :personal, :learning_subjects, :teaching_subjects

  def show
    @user = current_user
    case step
    when :learning_subjects
      @subjects = Subject.all
    when :teaching_subjects
      @subjects = Subject.all
    end
    authorize :after_signup, :show?
    render_wizard
  end

  def update
    @user = current_user
    authorize :after_signup, :update?
    case step
    when :personal
      @user.update_attributes(wizard_params)
    when :learning_subjects
      params.dig(:wizard, :subjects).reject(&:blank?).each do |id|
        @user.learning_subjects.create(subject_id: id)
      end
    when :teaching_subjects
      params.dig(:wizard, :subjects).reject(&:blank?).each do |id|
        @user.teaching_subjects.create(subject_id: id)
      end
      price = params.dig(:wizard, :price)
      @user.update(price: price) if price.present?
    end
    render_wizard @user

  end

  private

  def wizard_params
    params.require(:user).permit(:bio, :location, :price, languages: [])
  end
end
