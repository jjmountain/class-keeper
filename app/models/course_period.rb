class CoursePeriod < ApplicationRecord
  belongs_to :course
  belongs_to :period
  enum day: ['Mon', 'Tues', 'Wed', 'Thurs', 'Fri', 'Sat', 'Sun']
  validates :day, presence: true
end
