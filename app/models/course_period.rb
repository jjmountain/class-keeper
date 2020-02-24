class CoursePeriod < ApplicationRecord
  DAYS = ['Sun', 'Mon', 'Tues', 'Wed', 'Thurs', 'Fri', 'Sat']
  belongs_to :course
  belongs_to :period
  enum day: DAYS
  validates :day, presence: true
  validates :day, uniqueness: { scope: :period_id, message: 'and period are already selected' }
  scope :ordered, -> { 
    order(:day).joins(:period).merge(Period.order(:period_number))
   }
end
