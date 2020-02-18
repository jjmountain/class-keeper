class Period < ApplicationRecord
  belongs_to :school
  has_many :course_periods, dependent: :destroy

  def class_time
    "#{period_number}: #{start_time.strftime('%H:%M')} - #{end_time.strftime('%H:%M')}".strip()
  end
end
