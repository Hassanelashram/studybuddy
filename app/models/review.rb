class Review < ApplicationRecord
  belongs_to :reviewer, foreign_key: :reviewer_id, class_name: "User"
  belongs_to :reviewed, foreign_key: :reviewed_id, class_name: "User"

  validates :content, :stars, presence: true
  validates_length_of :content, minimum: 20, allow_blank: true
  validates :reviewer, uniqueness: { scope: :reviewed, message: 'You have already reviewed this user'}
end
