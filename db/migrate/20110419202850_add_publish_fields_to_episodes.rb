class AddPublishFieldsToEpisodes < ActiveRecord::Migration
  def self.up
    add_column :episodes, :slug, :string
    add_column :episodes, :published_at, :datetime
  end

  def self.down
    remove_column :episodes, :published_at
    remove_column :episodes, :slug
  end
end
