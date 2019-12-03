class RemoveSchoolFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :school
  end
end
