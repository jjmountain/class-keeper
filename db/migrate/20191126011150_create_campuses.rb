class CreateCampu < ActiveRecord::Migration[5.2]
  def change
    create_table :campu do |t|
      t.string :name
      t.string :address
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
