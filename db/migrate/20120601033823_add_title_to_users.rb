class AddTitleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :title, :string
    add_column :users, :avatar, :string
  end
end
