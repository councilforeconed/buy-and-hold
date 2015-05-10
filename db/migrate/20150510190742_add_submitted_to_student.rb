class AddSubmittedToStudent < ActiveRecord::Migration
  def change
    add_column :students, :submitted, :boolean, default: false
  end
end
