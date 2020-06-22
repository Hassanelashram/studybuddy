class Subject < ApplicationRecord
  has_many :learning_subjects, dependent: :destroy
  has_many :teaching_subjects, dependent: :destroy
end
