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

ActiveRecord::Schema.define(version: 20141017172704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acts", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cat_id"
  end

  create_table "categorizations", force: true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id", using: :btree
  add_index "categorizations", ["user_id"], name: "index_categorizations_on_user_id", using: :btree

  create_table "event_acts", force: true do |t|
    t.integer  "event_id"
    t.integer  "act_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_acts", ["act_id"], name: "index_event_acts_on_act_id", using: :btree
  add_index "event_acts", ["event_id"], name: "index_event_acts_on_event_id", using: :btree

  create_table "events", force: true do |t|
    t.datetime "start_time"
    t.integer  "venue_id"
    t.text     "description"
    t.string   "category"
    t.string   "genre"
    t.string   "name"
    t.integer  "rating"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "stop_time"
    t.string   "venue_name"
    t.text     "venue_address"
    t.string   "city_name"
    t.string   "image_url"
    t.integer  "user_id"
    t.string   "eventful_id"
    t.string   "category_list"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree
  add_index "events", ["venue_id"], name: "index_events_on_venue_id", using: :btree

<<<<<<< HEAD
  create_table "interests", force: true do |t|
    t.string   "interest_type"
    t.string   "genre"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interests", ["user_id"], name: "index_interests_on_user_id", using: :btree
=======
  create_table "follows", force: true do |t|
    t.string   "follower_type"
    t.integer  "follower_id"
    t.string   "followable_type"
    t.integer  "followable_id"
    t.datetime "created_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "likes", force: true do |t|
    t.string   "liker_type"
    t.integer  "liker_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
  end

  add_index "likes", ["likeable_id", "likeable_type"], name: "fk_likeables", using: :btree
  add_index "likes", ["liker_id", "liker_type"], name: "fk_likes", using: :btree

  create_table "mentions", force: true do |t|
    t.string   "mentioner_type"
    t.integer  "mentioner_id"
    t.string   "mentionable_type"
    t.integer  "mentionable_id"
    t.datetime "created_at"
  end

  add_index "mentions", ["mentionable_id", "mentionable_type"], name: "fk_mentionables", using: :btree
  add_index "mentions", ["mentioner_id", "mentioner_type"], name: "fk_mentions", using: :btree
>>>>>>> a6d74e3a285b77ff71cc073177ec9a15c2e46a99

  create_table "users", force: true do |t|
    t.string   "email",                                           default: "",    null: false
    t.string   "encrypted_password",                              default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.text     "description"
    t.decimal  "latitude",               precision: 10, scale: 6
    t.decimal  "longitude",              precision: 10, scale: 6
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "is_admin",                                        default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venue_acts", force: true do |t|
    t.integer  "venue_id"
    t.integer  "act_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "venue_acts", ["act_id"], name: "index_venue_acts_on_act_id", using: :btree
  add_index "venue_acts", ["venue_id"], name: "index_venue_acts_on_venue_id", using: :btree

  create_table "venues", force: true do |t|
    t.text     "location"
    t.string   "name"
    t.text     "description"
    t.string   "venue_type"
    t.string   "phone"
    t.string   "email"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "genre"
    t.string   "address"
  end

end
