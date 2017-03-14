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

ActiveRecord::Schema.define(version: 20170314201957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "composers", force: :cascade do |t|
    t.string   "name"
    t.integer  "event_id"
    t.integer  "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_composers_on_event_id", using: :btree
    t.index ["song_id"], name: "index_composers_on_song_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.integer  "requests_id"
    t.string   "canadian_performance"
    t.string   "date_of_program"
    t.string   "street1"
    t.string   "city"
    t.string   "province"
    t.string   "postal_code"
    t.string   "country"
    t.string   "marie_no"
    t.string   "type_of_program"
    t.string   "artist_name"
    t.string   "proof_type"
    t.string   "venue"
    t.string   "venuetype"
    t.string   "venuecapacity"
    t.string   "venue_phone"
    t.string   "venue_website"
    t.string   "performance_time"
    t.string   "promoter"
    t.string   "promoter_street1"
    t.string   "promoter_city"
    t.string   "promoter_province"
    t.string   "promoter_postal_code"
    t.string   "promoter_country"
    t.string   "promoter_telephone"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["requests_id"], name: "index_events_on_requests_id", using: :btree
  end

  create_table "requests", force: :cascade do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "fileName"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_songs_on_event_id", using: :btree
  end

  add_foreign_key "composers", "events"
  add_foreign_key "composers", "songs"
  add_foreign_key "events", "requests", column: "requests_id"
  add_foreign_key "songs", "events"
end
