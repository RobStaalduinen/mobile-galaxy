class Recommendation < ActiveRecord::Base
  belongs_to :store_listing
  belongs_to :recommended_listing, class_name: "AndroidStoreListing"
end
