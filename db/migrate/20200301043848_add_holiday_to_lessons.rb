class AddHolidayToLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :holiday, :boolean, default: false
  end
end
