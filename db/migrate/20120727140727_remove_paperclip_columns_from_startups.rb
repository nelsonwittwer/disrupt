class RemovePaperclipColumnsFromStartups < ActiveRecord::Migration
  def up
  	remove_column :startups, :logo_file_name
  	remove_column :startups, :logo_content_type
  	remove_column :startups, :logo_file_size
  	remove_column :startups, :logo_updated_at
  end

  def down
  end
end
