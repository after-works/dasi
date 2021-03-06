# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130801115458) do

  create_table "comment_logs", :force => true do |t|
    t.integer  "uid"
    t.integer  "comment_id"
    t.integer  "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "uid"
    t.integer  "songtag_id"
    t.text     "context"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "parent_cmt_id"
  end

  create_table "feedbacks", :force => true do |t|
    t.integer  "uid"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "feedbacks", ["uid"], :name => "index_feedbacks_on_uid_id"

  create_table "friends_relations", :force => true do |t|
    t.integer  "a_uid"
    t.integer  "b_uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "songs", :force => true do |t|
    t.integer  "tag_id"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "youtube_id"
    t.integer  "uid"
  end

  create_table "songtags", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.text     "content"
    t.integer  "uid",        :limit => 255
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "fb_uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "remember_token"
    t.integer  "admin"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "votes", :force => true do |t|
    t.integer  "uid"
    t.integer  "songtag_id"
    t.integer  "song_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
