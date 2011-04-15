class CreateEnclosures < ActiveRecord::Migration
  def self.up
    create_table :enclosures do |t|
      t.references :feed
      t.references :episode
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :enclosures
  end
end
