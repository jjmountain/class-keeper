class Lesson < ApplicationRecord
  belongs_to :course
  belongs_to :course_period
  has_many :lesson_sections
  has_many :attendances

  def date_with_day
    date.strftime('%a %b %e, %Y')
  end
end
