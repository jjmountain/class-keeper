class CreateScheduledLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :scheduled_lessons do |t|
      t.interval :duration
      t.boolean :completed
      t.datetime :start_time
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
