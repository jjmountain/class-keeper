class Period < ApplicationRecord
  belongs_to :faculty
  has_many :course_periods, dependent: :destroy
  validates :minutes, numericality: { only_integer: true, greater_than: 0 }
  validates :minutes, presence: true
  validates :start_time, presence: true
  validates :period_number, presence: true



  def class_time
    "#{start_time.strftime('%H:%M')} - #{end_time.strftime('%H:%M %P')}".strip()
  end

  def end_time
    start_time + minutes.minutes
  end
end
