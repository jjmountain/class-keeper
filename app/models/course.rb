class Course < ApplicationRecord
  belongs_to :user
  belongs_to :school
  belongs_to :faculty
  has_many :scheduled_lessons, dependent: :destroy
  has_many :course_periods, dependent: :destroy
  

  validates :name, presence: true

end
