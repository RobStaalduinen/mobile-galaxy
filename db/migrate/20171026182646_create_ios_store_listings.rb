class CreateIosStoreListings < ActiveRecord::Migration[5.1]
  def change
    create_table :ios_store_listings do |t|
      t.string :name, index: true
      t.string :package, index: true
      t.integer :developer_id
      t.text :description
      t.string :icon_url
      t.float :price
      t.float :rating
      t.integer :rating_count
      t.string :track_number
      t.datetime :parsed_at
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
