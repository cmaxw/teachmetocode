class CreateCategoriesEpisodes < ActiveRecord::Migration
  def self.up
    create_table :categories_episodes, :id => false do |t|
      t.integer :category_id
      t.integer :episode_id
    end
    
    add_index :categories_episodes, :category_id
    add_index :categories_episodes, :episode_id
  end

  def self.down
    drop_table :categories_episodes
  end
end
