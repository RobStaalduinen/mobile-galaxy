class CreateIosGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :ios_genres do |t|
      t.integer :ios_store_listing_id, index: true
      t.integer :genre_id, index: true

      t.timestamps
    end
  end
end
