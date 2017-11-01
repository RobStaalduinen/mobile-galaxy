class CreateAppGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :app_genres do |t|
      t.references :genreable, polymorphic: true, index: true
      t.integer :genre_id, index: true

      t.timestamps
    end
  end
end
