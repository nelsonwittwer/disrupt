class AddLogoToStartups < ActiveRecord::Migration
  def change
    add_column :startups, :logo, :string
  end
end
