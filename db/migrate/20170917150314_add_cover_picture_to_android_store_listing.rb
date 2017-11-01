class AddCoverPictureToAndroidStoreListing < ActiveRecord::Migration[5.1]
  def change
    add_column :android_store_listings, :cover_image_url, :string
  end
end
