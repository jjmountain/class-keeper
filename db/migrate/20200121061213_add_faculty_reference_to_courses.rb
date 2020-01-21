class AddFacultyReferenceToCourses < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :faculty, foreign_key: true
  end
end
