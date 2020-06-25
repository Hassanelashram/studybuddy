class Review < ApplicationRecord
  belongs_to :reviewer, foreign_key: :reviewer_id, class_name: "User"
  belongs_to :reviewed, foreign_key: :reviewed_id, class_name: "User"

  validates :content, :stars, presence: true
end
