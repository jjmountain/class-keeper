class CoursePeriod < ApplicationRecord
  DAYS = ['Mon', 'Tues', 'Wed', 'Thurs', 'Fri', 'Sat', 'Sun']
  belongs_to :course
  belongs_to :period
  enum day: DAYS
  validates :day, presence: true
  validates :day, uniqueness: { scope: :period_id, message: 'and period are already selected' }
end
