class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :access_code
      t.string :teacher_email
      t.string :section_code

      t.timestamps null: false
    end
  end
end
