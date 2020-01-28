class RemoveReferenceToScheduledLessonsFromLessons < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :scheduled_lesson_id
  end
end
