class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.string :ancestry

      t.timestamps
    end
    add_index :comments, :ancestry
  end
end
