class AddYearToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :year, :date
  end
end
