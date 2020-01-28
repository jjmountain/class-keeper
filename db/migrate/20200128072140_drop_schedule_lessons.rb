class DropScheduleLessons < ActiveRecord::Migration[5.2]
  def change
    def up
      drop_table :scheduled_lessons
    end
  
    def down
      create_table :scheduled_lessons
    end
  end
end
