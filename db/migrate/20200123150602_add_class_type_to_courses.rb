class AddClassTypeToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :class_type, :string
  end
end
