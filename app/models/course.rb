class Course < ApplicationRecord
  belongs_to :user
  belongs_to :school
  belongs_to :faculty
  has_many :lessons
  has_many :course_periods, dependent: :destroy
  has_many :enrollments, dependent: :destroy
  accepts_nested_attributes_for :school, allow_destroy: true, reject_if: proc { |attr| attr['name'].blank? }
  accepts_nested_attributes_for :faculty, allow_destroy: true, reject_if: proc { |attr| attr['name'].blank? }

  validates :name, presence: true

end
