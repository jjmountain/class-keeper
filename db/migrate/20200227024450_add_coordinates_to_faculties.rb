class AddCoordinatesToFaculties < ActiveRecord::Migration[6.0]
  def change
    add_column :faculties, :latitude, :float
    add_column :faculties, :longitude, :float
    add_column :faculties, :address, :string
  end
end
