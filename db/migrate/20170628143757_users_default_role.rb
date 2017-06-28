class UsersDefaultRole < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :role, :text, :default => '1'
  end
end
