class CreateEpisodesTags < ActiveRecord::Migration
  def self.up
    create_table :episodes_tags, :id => false do |t|
      t.integer :episode_id
      t.integer :tag_id
    end
    
    add_index :episodes_tags, :episode_id
    add_index :episodes_tags, :tag_id
  end

  def self.down
    drop_table :episodes_tags
  end
end
