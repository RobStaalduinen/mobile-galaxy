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

ActiveRecord::Schema.define(version: 20171031145258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "developers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_genres_on_name"
  end

  create_table "ios_genres", force: :cascade do |t|
    t.integer "ios_store_listing_id"
    t.integer "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_ios_genres_on_genre_id"
    t.index ["ios_store_listing_id"], name: "index_ios_genres_on_ios_store_listing_id"
  end

  create_table "ios_search_terms", force: :cascade do |t|
    t.string "term"
    t.index ["term"], name: "index_ios_search_terms_on_term"
  end

  create_table "ios_store_listings", force: :cascade do |t|
    t.string "name"
    t.string "bundle"
    t.text "description"
    t.string "icon_url"
    t.integer "developer_id"
    t.float "price"
    t.float "rating"
    t.integer "rating_count"
    t.string "category"
    t.string "track_number"
    t.datetime "parsed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bundle"], name: "index_ios_store_listings_on_bundle"
    t.index ["name"], name: "index_ios_store_listings_on_name"
    t.index ["track_number"], name: "index_ios_store_listings_on_track_number"
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
    t.string "cover_image_url"
    t.index ["name"], name: "index_store_listings_on_name"
    t.index ["package"], name: "index_store_listings_on_package"
  end

end
