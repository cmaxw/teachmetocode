class AddShowImageToShows < ActiveRecord::Migration
  def self.up
    add_column :shows, :show_image, :boolean
  end

  def self.down
    remove_column :shows, :show_image
  end
end
