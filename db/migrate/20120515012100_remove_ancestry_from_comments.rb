class RemoveAncestryFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :ancestry
    remove_column :comments, :lft
    remove_column :comments, :rgt
    add_column	:comments, :ancestry, :string
    add_index :comments, :ancestry
      end

  def down
    add_column :comments, :ancestry, :integer
    add_column :comments, :lft, :integer
    add_column :comments, :rgt, :integer
    remove_column	:comments, :ancestry
    remove_index :comments, :ancestry
  end
end
