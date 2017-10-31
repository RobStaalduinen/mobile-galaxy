class AddCoverPictureToStoreListing < ActiveRecord::Migration[5.1]
  def change
    add_column :store_listings, :cover_image_url, :string
  end
end
