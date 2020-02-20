class Period < ApplicationRecord
  belongs_to :faculty
  has_many :course_periods
  validates :minutes, numericality: { only_integer: true, greater_than: 0 }
  validates :minutes, presence: true
  validates :start_time, presence: true
  validates :period_number, uniqueness: { scope: :faculty_id }, numericality: { only_integer: true, less_than: 13 }
  validate :periods_not_overlapping



  def class_time
    "#{period_number}: #{start_time.strftime('%H:%M')} - #{end_time.strftime('%H:%M %P')}".strip()
  end

  def end_time
    start_time + minutes.minutes
  end

  private

  def periods_not_overlapping
    Period.where(faculty_id: faculty_id).each do |existing_period|
      # check that the period start time doesn't overlap with the existing period
      if self.start_time.strftime("%H%M%S") >= existing_period.start_time.strftime("%H%M%S") && self.start_time.strftime("%H%M%S") <= existing_period.end_time.strftime("%H%M%S")
        errors.add(:start_date, "must not overlap with existing period")
      elsif self.end_time.strftime("%H%M%S") >= existing_period.start_time.strftime("%H%M%S") && self.end_time.strftime("%H%M%S") <= existing_period.end_time.strftime("%H%M%S")
        # check that the period end time doesn't overlap with the existing period
        errors.add(:start_date, "must not overlap with existing period")
      end
    end
  end

end
