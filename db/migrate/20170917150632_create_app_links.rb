class CreateAppLinks< ActiveRecord::Migration[5.1]
  def change
    create_table :app_links do |t|
      t.references :base, polymorphic: true, index: true
      t.references :recommendation, polymorphic: true, index: true
      t.integer :similarity, default: 1
      t.integer :user_activity, defaut: 0

      t.timestamps null: false
    end
  end
end
