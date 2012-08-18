class AddDefaultRoleToUsers < ActiveRecord::Migration
  def change
  	change_column :users, :role_id, :integer, :default => 3
  end
end
