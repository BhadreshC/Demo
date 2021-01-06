class RenameJoinTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :students_teachers, :teachers_students
  end
end
