class AddWeekToLesson < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :week, :integer
  end
end
