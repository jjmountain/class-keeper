class CreatePeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :periods do |t|
      t.integer :period_number
      t.time :start_time
      t.time :end_time
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
