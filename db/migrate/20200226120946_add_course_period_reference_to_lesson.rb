class AddCoursePeriodReferenceToLesson < ActiveRecord::Migration[6.0]
  def change
    add_reference :lessons, :course_period, foreign_key: true
  end
end
