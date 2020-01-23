class RemoveDayFromPeriods < ActiveRecord::Migration[5.2]
  def up
    remove_column :periods, :day
  end

  def down
    add_column :periods, :day
  end
end
