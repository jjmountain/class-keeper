class CreateCoursePeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :course_periods do |t|
      t.integer :day
      t.references :course, foreign_key: true
      t.references :period, foreign_key: true

      t.timestamps
    end
  end
end
