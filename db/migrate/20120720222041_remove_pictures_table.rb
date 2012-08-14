class RemovePicturesTable < ActiveRecord::Migration
  def up
  	drop_table :pictures

  end

end
