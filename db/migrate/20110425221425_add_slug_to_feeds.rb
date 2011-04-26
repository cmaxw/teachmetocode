class AddSlugToFeeds < ActiveRecord::Migration
  def self.up
    add_column :feeds, :slug, :string
  end

  def self.down
    remove_column :feeds, :slug
  end
end
