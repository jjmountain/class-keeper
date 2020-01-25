class AddClassNumberToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :class_number, :integer
  end
end
