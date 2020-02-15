class AddReferenceOnFacultiesToSchools < ActiveRecord::Migration[6.0]
  def change
    add_reference :faculties, :school, foreign_key: true
  end
end
