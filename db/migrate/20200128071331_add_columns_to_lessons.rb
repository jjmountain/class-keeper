class AddColumnsToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :duration, :interval
    add_reference :lessons, :courses, foreign_key: true
  end
end

