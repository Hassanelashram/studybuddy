class Booking < ApplicationRecord
  monetize :total_cents
  belongs_to :student, class_name:  'User'
  belongs_to :mentor, class_name:  'User'
  enum status: [:pending, :accepted, :rejected, :paid]
  validates :total_cents, presence: true
  validates :start_date, presence: true
  validates :duration, presence: true
  def number_of_hours
    self.duration
  end
end
