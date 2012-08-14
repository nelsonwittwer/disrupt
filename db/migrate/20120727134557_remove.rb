class Remove < ActiveRecord::Migration
  def up
  	remove_column :startups, :logo
  end

  def down
  end
end
