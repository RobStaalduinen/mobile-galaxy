class IosGenres < ActiveRecord::Base
  belongs_to :ios_store_listing
  belongs_to :genre
end
