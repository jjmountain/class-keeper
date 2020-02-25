class RemoveReferenceToCoursesIdOnLessons < ActiveRecord::Migration[6.0]
  def change
    remove_reference :lessons, :courses
    add_reference :lessons, :course, foreign_key: true
    rename_column :lessons, :start_time, :date
  end
end
