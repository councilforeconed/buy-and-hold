class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :company
      t.string :symbol
      t.float :initial_value
      t.float :price_2002
      t.float :price_2007
      t.text :description

      t.timestamps null: false
    end
  end
end
