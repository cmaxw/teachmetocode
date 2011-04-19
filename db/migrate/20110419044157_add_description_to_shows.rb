class AddDescriptionToShows < ActiveRecord::Migration
  def self.up
    add_column :shows, :description, :text
  end

  def self.down
    remove_column :shows, :description
  end
end
