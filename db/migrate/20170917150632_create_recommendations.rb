class CreateRecommendations < ActiveRecord::Migration[5.1]
  def change
    create_table :recommendations do |t|
      t.belongs_to :store_listing
      t.integer :recommended_listing_id, index: true
      t.integer :rating, default: 1

      t.timestamps null: false
    end
  end
end
