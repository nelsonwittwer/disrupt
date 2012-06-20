class RemoveStartupidFromPictures < ActiveRecord::Migration
  def up
    remove_column :pictures, :startup_id
      end

  def down
    add_column :pictures, :startup_id, :integer
  end
end
