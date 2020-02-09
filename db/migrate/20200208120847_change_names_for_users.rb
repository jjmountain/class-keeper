class ChangeNamesForUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :first_name, :given_name
    rename_column :users, :last_name, :family_name
  end
end
