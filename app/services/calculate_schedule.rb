class CalculateSchedule

  def self.call(lessons_schedule)
    planned_lessons = []
    weeks = (lessons_schedule.end_date - lessons_schedule.start_date).to_i / 7
    course_periods =  lessons_schedule.course.course_periods.ordered
    next_date = lessons_schedule.start_date
    next_lesson_day_diff = 0
     (1..(weeks + 1)).to_a.each do |week|
      course_periods.each do | course_period |
        next_lesson_day_diff = CoursePeriod::DAYS.index(course_period.day) - next_date.wday 
        next_date += next_lesson_day_diff.days
        if next_date <= lessons_schedule.end_date
          date_period_array = [course_period.id, next_date.strftime('%Y-%m-%d'), week, course_period.day, course_period.period.period_number, next_date.strftime('%b %d, %Y')]
          planned_lessons << date_period_array
        end
      end
      next_date = next_date.next_week
    end
    planned_lessons
  end

end