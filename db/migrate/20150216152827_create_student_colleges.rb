class CreateStudentColleges < ActiveRecord::Migration
  def change
    create_table :student_colleges do |t|
      t.references :student, index: true
      t.references :college, index: true

      t.timestamps null: false
    end
    add_foreign_key :student_colleges, :students
    add_foreign_key :student_colleges, :colleges
  end
end
