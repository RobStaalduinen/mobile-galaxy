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

  create_table "android_store_listings", force: :cascade do |t|
    t.string "name"
    t.string "package"
    t.integer "developer_id"
    t.text "description"
    t.float "price"
    t.float "rating"
    t.integer "rating_count"
    t.string "store_url"
    t.string "installs"
    t.datetime "parsed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cover_image_url"
    t.index ["name"], name: "index_android_store_listings_on_name"
    t.index ["package"], name: "index_android_store_listings_on_package"
  end

  create_table "app_genres", force: :cascade do |t|
    t.string "genreable_type"
    t.bigint "genreable_id"
    t.integer "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_app_genres_on_genre_id"
    t.index ["genreable_type", "genreable_id"], name: "index_app_genres_on_genreable_type_and_genreable_id"
  end

  create_table "app_links", force: :cascade do |t|
    t.string "base_type"
    t.bigint "base_id"
    t.string "recommendation_type"
    t.bigint "recommendation_id"
    t.integer "similarity", default: 1
    t.integer "user_activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["base_type", "base_id"], name: "index_app_links_on_base_type_and_base_id"
    t.index ["recommendation_type", "recommendation_id"], name: "index_app_links_on_recommendation_type_and_recommendation_id"
  end

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

  create_table "ios_search_terms", force: :cascade do |t|
    t.string "name"
    t.datetime "parsed_at", default: "1970-01-01 00:00:00"
    t.index ["name"], name: "index_ios_search_terms_on_name"
  end

  create_table "ios_store_listings", force: :cascade do |t|
    t.string "name"
    t.string "package"
    t.integer "developer_id"
    t.text "description"
    t.string "icon_url"
    t.float "price"
    t.float "rating"
    t.integer "rating_count"
    t.string "track_number"
    t.datetime "parsed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_ios_store_listings_on_name"
    t.index ["package"], name: "index_ios_store_listings_on_package"
  end

end
