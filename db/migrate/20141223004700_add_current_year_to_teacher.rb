class AddCurrentYearToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :current_year, :integer, default: 2000
  end
end
