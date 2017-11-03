class CreateAndroidStoreListing < ActiveRecord::Migration[5.1]
  def change
    create_table :android_store_listings do |t|
      t.string :name, index: true
      t.string :package, index: true
      t.integer :developer_id
      t.text :description
      t.float :price
      t.float :rating
      t.integer :rating_count
      t.string :store_url
      t.string :installs

      t.datetime :parsed_at
      t.timestamps null: false
    end
  end
end
