module Recommendable
  extend ActiveSupport::Concern
  
  included do
    has_many :app_links, as: :base
    has_many :recommendations, through: :app_links, source_type: "AndroidStoreListing"
    has_many :inverse_app_links, :class_name => "AppLink", :foreign_key => "recommendation_id"
    has_many :inverse_recommendations, :through => :inverse_app_links, :source => :base, source_type: "AndroidStoreListing"
  end

  def all_recommendations
    self.recommendations + self.inverse_recommendations
  end


end
