class CreateDeveloper < ActiveRecord::Migration[5.1]
  def change
    create_table :developers do |t|
      t.string :name
      t.timestamps null: false
    end

    add_column :android_store_listings, :developer_id, :integer, index: true
  end
end
