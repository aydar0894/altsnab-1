class CorrectFirstNameForUser < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :firts_name
  	add_column :users, :first_name, :text
  end
end
