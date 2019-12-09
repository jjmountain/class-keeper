class Period < ApplicationRecord
  belongs_to :school
  has_many :course_periods, dependent: :destroy

  def class_time
    "#{self.start_time.strftime('%H:%M')} - #{self.end_time.strftime('%H:%M')}".strip()
  end
end