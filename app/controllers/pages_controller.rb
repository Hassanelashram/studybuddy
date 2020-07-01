class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @mentors = User.joins(teaching_subjects: :subject).limit(3)
  end
end
