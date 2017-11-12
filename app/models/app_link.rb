class AppLink < ActiveRecord::Base
  belongs_to :base, polymorphic: true
  belongs_to :recommendation, polymorphic: true

  RECOMMENDATION_CUTOFF = 20
end
