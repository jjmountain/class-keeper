class RemovePeriodIdFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :period_id
  end
end
