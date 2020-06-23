class User < ApplicationRecord
  has_many :learning_subjects
  has_many :teaching_subjects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo

  def full_name
    self.name.capitalize + ' ' + self.surname.capitalize
  end

  def profile_completetion
    total_points = 2
    total_points += 1 if self.location.present?
    total_points += 1 if self.bio.present?
    total_points += 1 if self.photo.attached?
    return total_points
  end

  def completion_percentage
    points = profile_completetion
    percentage = points * 2 * 10
  end
end
