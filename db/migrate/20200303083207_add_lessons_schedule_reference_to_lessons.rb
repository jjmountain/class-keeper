class AddLessonsScheduleReferenceToLessons < ActiveRecord::Migration[6.0]
  def change
    add_reference :lessons, :lessons_schedules, foreign_key: true
  end
end
