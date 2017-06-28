class DevideNameInUsersOnThreeAttributes < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :name
  	add_column :users, :firts_name, :text
  	add_column :users, :middle_name, :text
  	add_column :users, :last_name, :text
  end
end
