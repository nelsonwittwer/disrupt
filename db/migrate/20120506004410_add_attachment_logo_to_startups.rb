class AddAttachmentLogoToStartups < ActiveRecord::Migration
  def self.up
    add_column :startups, :logo_file_name, :string
    add_column :startups, :logo_content_type, :string
    add_column :startups, :logo_file_size, :integer
    add_column :startups, :logo_updated_at, :datetime
  end

  def self.down
    remove_column :startups, :logo_file_name
    remove_column :startups, :logo_content_type
    remove_column :startups, :logo_file_size
    remove_column :startups, :logo_updated_at
  end
end
