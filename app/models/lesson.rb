class Lesson < ApplicationRecord
  belongs_to :scheduled_lesson
  has_many :lesson_sections
  has_many :attendances
  validates :scheduled_lesson_id, presence: true
end
