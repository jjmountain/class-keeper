class ChangeClassNumberToString < ActiveRecord::Migration[6.0]
  def up
    change_column :courses, :class_number, :string
  end

  def down
    change_column :courses, :class_number, :integer
  end
end
