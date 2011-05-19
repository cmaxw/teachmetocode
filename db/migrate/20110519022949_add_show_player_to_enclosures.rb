class AddShowPlayerToEnclosures < ActiveRecord::Migration
  def self.up
    add_column :enclosures, :show_player, :boolean
  end

  def self.down
    remove_column :enclosures, :show_player
  end
end
