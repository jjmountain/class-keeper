class CreateLessonsSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons_schedules do |t|
      t.date :start_date
      t.date :end_date
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
