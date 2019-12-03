class Course < ApplicationRecord
  belongs_to :user
  belongs_to :period
  has_many :scheduled_lessons
  validates :name, presence: true
end
