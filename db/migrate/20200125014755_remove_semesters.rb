class RemoveSemesters < ActiveRecord::Migration[5.2]
  def up
    drop_table :semester_courses
    drop_table :semesters
  end

  def down
    create_table :semester_courses
    create_table :semesters
  end
end
