class AddFacultyToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :faculty, :string
  end
end
