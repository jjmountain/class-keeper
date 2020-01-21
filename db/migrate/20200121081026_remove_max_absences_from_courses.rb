class RemoveMaxAbsencesFromCourses < ActiveRecord::Migration[5.2]
  def up
    remove_column :courses, :max_absences
  end

  def down
    add_column :courses, :max_absences
  end
end
