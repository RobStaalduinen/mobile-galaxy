class CreateStoreListing < ActiveRecord::Migration[5.1]
  def change
    create_table :store_listings do |t|
      t.string :name
      t.string :package
      t.text :description
      t.float :price
      t.float :rating
      t.integer :rating_count
      t.string :category
      t.string :store_url
      t.string :installs



      t.datetime :parsed_at
      t.timestamps null: false
    end
  end
end
