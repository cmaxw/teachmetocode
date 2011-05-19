class CreateEpisodesUsers < ActiveRecord::Migration
  def self.up
    create_table :episodes_users, :id => false do |t|
      t.integer :episode_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :episodes_users
  end
end
