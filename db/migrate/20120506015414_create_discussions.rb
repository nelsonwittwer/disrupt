class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :title
	  t.references :imageable, :polymorphic => true
      t.timestamps
    end
  end
end
