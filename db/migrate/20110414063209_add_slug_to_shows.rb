class AddSlugToShows < ActiveRecord::Migration
  def self.up
    add_column :shows, :slug, :string
  end

  def self.down
    remove_column :shows, :slug
  end
end
