class AddIndex < ActiveRecord::Migration
  def change
  	add_index :taggings, :startup_id
  	add_index :taggings, :tag_id
  end
end
