class AddLessonsPerWeekToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :lessons_per_week, :integer, default: 1
    add_column :courses, :weeks_per_course, :integer, default: 14
  end
end
