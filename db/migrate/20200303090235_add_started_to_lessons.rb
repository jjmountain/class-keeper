class AddStartedToLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :started, :boolean, default: false
  end
end
