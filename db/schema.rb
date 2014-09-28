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

ActiveRecord::Schema.define(version: 20140928184757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acts", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_acts", force: true do |t|
    t.integer  "event_id"
    t.integer  "act_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_acts", ["act_id"], name: "index_event_acts_on_act_id", using: :btree
  add_index "event_acts", ["event_id"], name: "index_event_acts_on_event_id", using: :btree

  create_table "events", force: true do |t|
    t.datetime "starttime"
    t.integer  "runtime"
    t.integer  "venue_id"
    t.text     "description"
    t.string   "type"
    t.string   "genre"
    t.string   "name"
    t.integer  "rating"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["venue_id"], name: "index_events_on_venue_id", using: :btree

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
    t.string   "type"
    t.string   "phone"
    t.string   "email"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
