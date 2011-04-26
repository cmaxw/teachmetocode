class AddSizeAndMimeToEnclosures < ActiveRecord::Migration
  def self.up
    add_column :enclosures, :mime, :string
    add_column :enclosures, :size, :string
  end

  def self.down
    remove_column :enclosures, :size
    remove_column :enclosures, :mime
  end
end
