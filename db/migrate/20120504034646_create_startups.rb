class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.string :name
      t.string :url
      t.string :twitter
      t.string :crunchbase
      t.string :screenshot
      t.string :logo
      t.text :description

      t.timestamps
    end
  end
end
