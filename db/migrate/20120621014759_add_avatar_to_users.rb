class AddAvatarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pic_file_name, :string
    add_index :users, :pic_file_name
  end
end
