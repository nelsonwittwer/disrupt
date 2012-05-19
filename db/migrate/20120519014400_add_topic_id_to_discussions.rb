class AddTopicIdToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :topic_id, :integer
    add_index :discussions, :topic_id
  end
end
