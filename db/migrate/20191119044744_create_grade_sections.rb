class CreateGradeSections < ActiveRecord::Migration[5.2]
  def change
    create_table :grade_sections do |t|
      t.string :name
      t.integer :score
      t.references :enrollment, foreign_key: true

      t.timestamps
    end
  end
end
