class CreateMarketsStartupJoinTable < ActiveRecord::Migration
  def up
    create_table :markets_startups, :id => false do |t|
      t.integer :market_id	
      t.integer :startup_id
    end
  end

  def down
    drop_table :markets_startups, :id => false do |t|
      t.integer :market_id	
      t.integer :startup_id
    end
  end
end
