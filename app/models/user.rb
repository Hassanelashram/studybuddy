class User < ApplicationRecord
  monetize :price_cents
  has_many :learning_subjects
  has_many :teaching_subjects
  has_many :received_bookings, foreign_key: :mentor_id, class_name: 'Booking'
  has_many :sent_bookings, foreign_key: :student_id, class_name: 'Booking'
  has_many :received_reviews, foreign_key: :reviewed_id, class_name: "Review", dependent: :destroy
  has_many :sent_reviews, foreign_key: :reviewer_id, class_name: "Review", dependent: :destroy
  accepts_nested_attributes_for :learning_subjects
  accepts_nested_attributes_for :teaching_subjects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo

  validates :email, :name, :surname, presence: true
  validates :bio, presence: true, on: :update, length: { minimum: 40 }
  validates :language, :location, presence: true, on: :update

  def full_name
    self.name.capitalize + ' ' + self.surname.capitalize
  end

  def self.languages_from_search(users)
    users.map(&:language).uniq
  end

  def average_ratings
    return if received_reviews.count.nil?

    total_stars = received_reviews.pluck(:stars).sum
    total_stars.fdiv(received_reviews.count).round(1)
  end

  def profile_completetion_percentage
    
  end

  def completion_percentage
    total_points = 2
    total_points += 1 if location.present?
    total_points += 1 if bio.present?
    total_points += 1 if photo.attached?
    total_points * 2 * 10
  end

  def earnings
     received_bookings.sum(:total_cents)
  end
end
