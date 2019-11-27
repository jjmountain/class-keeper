class CreateCampus < ActiveRecord::Migration[5.2]
  def change
    create_table :campus do |t|
      t.string :name
      t.string :address
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
