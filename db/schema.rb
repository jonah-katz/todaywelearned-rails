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

ActiveRecord::Schema.define(version: 20170314022133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appreciates", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tidbit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tidbit_id"], name: "index_appreciates_on_tidbit_id", using: :btree
    t.index ["user_id"], name: "index_appreciates_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "tidbit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tidbit_id"], name: "index_comments_on_tidbit_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_tidbits", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "tidbit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_tags_tidbits_on_tag_id", using: :btree
    t.index ["tidbit_id"], name: "index_tags_tidbits_on_tidbit_id", using: :btree
  end

  create_table "tidbits", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "source"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id"
    t.string   "location",    default: ""
    t.index ["user_id"], name: "index_tidbits_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["location_id"], name: "index_users_on_location_id", using: :btree
  end

  add_foreign_key "appreciates", "tidbits"
  add_foreign_key "appreciates", "users"
  add_foreign_key "comments", "tidbits"
  add_foreign_key "comments", "users"
  add_foreign_key "tags_tidbits", "tags"
  add_foreign_key "tags_tidbits", "tidbits"
  add_foreign_key "tidbits", "users"
  add_foreign_key "users", "locations"
end
