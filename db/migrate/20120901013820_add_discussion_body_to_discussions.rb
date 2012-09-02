class AddDiscussionBodyToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :discussion_body, :text
  end
end
