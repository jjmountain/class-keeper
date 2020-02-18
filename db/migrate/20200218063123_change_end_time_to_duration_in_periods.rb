class ChangeEndTimeToDurationInPeriods < ActiveRecord::Migration[6.0]
  def up
    remove_column :periods, :end_time
    add_column :periods, :minutes, :integer 
  end

  def down
    add_column :periods, :end_time, :time
  end
end
