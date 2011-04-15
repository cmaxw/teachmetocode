class CreateFeedsShowsTable < ActiveRecord::Migration
  def self.up
    create_table :feeds_shows, :id => false do |t|
      t.integer :feed_id
      t.integer :show_id
    end
    
    add_index :feeds_shows, :feed_id
    add_index :feeds_shows, :show_id
  end

  def self.down
    drop_table :feeds_shows
  end
end
