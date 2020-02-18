class RemoveAssociationFromPeriodToSchool < ActiveRecord::Migration[6.0]
  def change
    remove_reference :periods, :school
    add_reference :periods, :faculty, foreign_key: true
  end
end
