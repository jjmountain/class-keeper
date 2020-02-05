class ChangeNamesOnStudent < ActiveRecord::Migration[5.2]
  def change
    rename_column :students, :first_name, :given_name
    rename_column :students, :last_name, :family_name
  end
end
