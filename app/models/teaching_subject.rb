class TeachingSubject < ApplicationRecord
  belongs_to :user
  belongs_to :subject

  delegate :name, to: :subject
end
