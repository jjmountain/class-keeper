class CreateLessonSections < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_sections do |t|
      t.string :goal
      t.interval :duration
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
