class RemoveScreenshotFromStartups < ActiveRecord::Migration
  def up
    remove_column :startups, :screenshot
      end

  def down
    add_column :startups, :screenshot, :string
  end
end
