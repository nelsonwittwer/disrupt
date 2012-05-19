class RemoveDepthFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :depth
      end

  def down
    add_column :comments, :depth, :integer
  end
end
