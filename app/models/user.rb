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
end
