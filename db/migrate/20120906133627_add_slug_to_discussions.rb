class AddSlugToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :slug, :string
    add_index :discussions, :slug
  end
end
