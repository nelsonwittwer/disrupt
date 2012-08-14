class AddAttachmentScreenshotToStartups < ActiveRecord::Migration
  def self.up
    add_column :startups, :screenshot_file_name, :string
    add_column :startups, :screenshot_content_type, :string
    add_column :startups, :screenshot_file_size, :integer
    add_column :startups, :screenshot_updated_at, :datetime
  end

  def self.down
    remove_column :startups, :screenshot_file_name
    remove_column :startups, :screenshot_content_type
    remove_column :startups, :screenshot_file_size
    remove_column :startups, :screenshot_updated_at
  end
end
