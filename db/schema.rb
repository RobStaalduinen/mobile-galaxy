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

ActiveRecord::Schema.define(version: 20170917150632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "developers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.bigint "store_listing_id"
    t.integer "recommended_listing_id"
    t.integer "rating", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recommended_listing_id"], name: "index_recommendations_on_recommended_listing_id"
    t.index ["store_listing_id"], name: "index_recommendations_on_store_listing_id"
  end

  create_table "store_listings", force: :cascade do |t|
    t.string "name"
    t.string "package"
    t.text "description"
    t.float "price"
    t.float "rating"
    t.integer "rating_count"
    t.string "category"
    t.string "store_url"
    t.string "installs"
    t.datetime "parsed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "developer_id"
    t.string "cover_picture_url"
  end

end
