class AddCourseRefToPeriods < ActiveRecord::Migration[5.2]
  def change
    add_reference :periods, :course, foreign_key: true
  end
end
