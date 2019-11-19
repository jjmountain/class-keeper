class AddStudentNumberToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :student_number, :string
  end
end
