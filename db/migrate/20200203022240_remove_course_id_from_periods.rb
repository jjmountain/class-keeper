class RemoveCourseIdFromPeriods < ActiveRecord::Migration[5.2]
  def up
    remove_column :periods, :course_id
  end

  def down
    add_column :periods, :course_id
  end
end
