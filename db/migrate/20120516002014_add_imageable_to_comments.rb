class AddImageableToComments < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|
      t.references :imageable, :polymorphic => true
    end
  end

  def self.down
    change_table :comments do |t|
      t.remove_references :imageable, :polymorphic => true
    end
  end
end
