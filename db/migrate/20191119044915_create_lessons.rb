class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.text :objective
      t.datetime :start_time, default: DateTime.now
      t.datetime :end_time
      t.references :scheduled_lesson, foreign_key: true

      t.timestamps
    end
  end
end
