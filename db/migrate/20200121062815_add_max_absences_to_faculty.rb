class AddMaxAbsencesToFaculty < ActiveRecord::Migration[5.2]
  def change
    add_column :faculties, :max_absences, :integer
  end
end
