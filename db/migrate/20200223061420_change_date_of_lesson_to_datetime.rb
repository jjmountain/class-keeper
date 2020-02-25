class ChangeDateOfLessonToDatetime < ActiveRecord::Migration[6.0]
  def change
    change_column :lessons, :date, :datetime
  end
end
