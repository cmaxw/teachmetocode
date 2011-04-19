# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110419044157) do

  create_table "enclosures", :force => true do |t|
    t.integer  "feed_id"
    t.integer  "episode_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "episodes", :force => true do |t|
    t.string   "title"
    t.text     "copy"
    t.integer  "show_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feeds", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feeds_shows", :id => false, :force => true do |t|
    t.integer "feed_id"
    t.integer "show_id"
  end

  add_index "feeds_shows", ["feed_id"], :name => "index_feeds_shows_on_feed_id"
  add_index "feeds_shows", ["show_id"], :name => "index_feeds_shows_on_show_id"

  create_table "shows", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
