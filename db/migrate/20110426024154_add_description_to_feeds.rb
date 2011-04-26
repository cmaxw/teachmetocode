class AddDescriptionToFeeds < ActiveRecord::Migration
  def self.up
    add_column :feeds, :description, :text
  end

  def self.down
    remove_column :feeds, :description
  end
end
