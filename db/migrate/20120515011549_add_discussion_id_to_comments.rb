class AddDiscussionIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :discussion_id, :integer, :null => false
    add_index :comments, :discussion_id
  end
end
