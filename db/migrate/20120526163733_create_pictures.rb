class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :url
      t.integer :startup_id

      t.timestamps
    end
    add_index :pictures, :startup_id
  end
end
