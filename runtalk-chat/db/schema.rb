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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130622185145) do

  create_table "chats", force: true do |t|
    t.string   "slug"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invitations", force: true do |t|
    t.integer  "user_id"
    t.integer  "chat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unique_url"
    t.string   "phone_number"
  end

  add_index "invitations", ["chat_id"], name: "index_invitations_on_chat_id"
  add_index "invitations", ["user_id"], name: "index_invitations_on_user_id"

  create_table "locations", force: true do |t|
    t.integer  "message_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "accuracy"
    t.string   "formatted_address"
    t.string   "map_url"
  end

  add_index "locations", ["message_id"], name: "index_locations_on_message_id"

  create_table "messages", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "chat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["chat_id"], name: "index_messages_on_chat_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "photos", force: true do |t|
    t.string   "photo_url"
    t.integer  "message_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["message_id"], name: "index_photos_on_message_id"

  create_table "users", force: true do |t|
    t.string   "username",         null: false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
