class RemoveDiscussionIdFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :discussion_id
      end

  def down
    add_column :comments, :discussion_id, :integer
  end
end
