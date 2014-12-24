class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.integer :student_id
      t.integer :stock_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
