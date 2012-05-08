class RemoveLogoFromStartup < ActiveRecord::Migration
  def up
    remove_column :startups, :logo
      end

  def down
    add_column :startups, :logo, :string
  end
end
