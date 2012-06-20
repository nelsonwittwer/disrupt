class AddImageableToPictures < ActiveRecord::Migration
    def self.up
    change_table :pictures do |t|
      t.references :imageable, :polymorphic => true
    end
  end

  def self.down
    change_table :pictures do |t|
      t.remove_references :imageable, :polymorphic => true
    end
  end
end
