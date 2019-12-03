class RenameAbsencesColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :courses, :max_abscences, :max_absences
  end
end
