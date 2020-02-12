class Course < ApplicationRecord
  belongs_to :user
  belongs_to :school
  belongs_to :faculty
  has_many :lessons
  has_many :course_periods, dependent: :destroy
  has_many :enrollments, dependent: :destroy
  

  validates :name, presence: true

end
