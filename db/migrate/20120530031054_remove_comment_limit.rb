class RemoveCommentLimit < ActiveRecord::Migration
  def up
  	change_column :comments, :text, :text, :limit => nil
  end

end
