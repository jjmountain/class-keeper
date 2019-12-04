class AddDayToPeriods < ActiveRecord::Migration[5.2]
  def change
    add_column :periods, :day, :integer
  end
end
