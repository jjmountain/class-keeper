class Course < ApplicationRecord
  belongs_to :user
  has_many :scheduled_lessons
  has_many :courses
  validates :name, presence: true
end
