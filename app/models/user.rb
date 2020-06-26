class User < ApplicationRecord
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
  
  validates :email, presence: true
  validates :name, presence: true
  validates :surname, presence: true

  def full_name
    self.name.capitalize + ' ' + self.surname.capitalize
  end

  def average_ratings
    reviews = Review.where(reviewed_id: self.id)
    sum = 0
    reviews.each do |r|
      sum += r.stars
    end
    average = sum.fdiv(reviews.count)
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

  def earnings
    sum = 0
    totals = []
    self.received_bookings.each do |booking|
      booking_total = booking.mentor.price * (booking.end_date.hour - booking.start_date.hour)
      totals << booking_total
    end
    return totals.sum
  end
end
