class Booking < ApplicationRecord
  belongs_to :student, class_name:  'User'
  belongs_to :mentor, class_name:  'User'

   enum status: [:pending, :accepted, :rejected]

  def self.number_of_hours
    self.end_date.hour - self.start_date.hour
  end
end
