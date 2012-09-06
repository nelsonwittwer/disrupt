class AddSlugToStartups < ActiveRecord::Migration
  def change
    add_column :startups, :slug, :string
    add_index :startups, :slug
  end
end
