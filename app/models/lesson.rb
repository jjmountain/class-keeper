class Lesson < ApplicationRecord
  belongs_to :course
  has_many :lesson_sections
  has_many :attendances
end
