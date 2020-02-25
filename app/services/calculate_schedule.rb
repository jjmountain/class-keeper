class CalculateSchedule

  def self.call(lessons_schedule)
    planned_lessons = []
    weeks = (lessons_schedule.end_date - lessons_schedule.start_date).to_i / 7
    course_periods =  lessons_schedule.course.course_periods.ordered
    next_date = lessons_schedule.start_date
    next_lesson_day_diff = 0
    (weeks + 1).times do
      course_periods.each do | course_period |
        next_lesson_day_diff = CoursePeriod::DAYS.index(course_period.day) - next_date.wday 
        next_date += next_lesson_day_diff.days
        if next_date <= lessons_schedule.end_date
          planned_lessons << next_date
        end
      end
      next_date = next_date.next_week
    end
    planned_lessons 
  end

end