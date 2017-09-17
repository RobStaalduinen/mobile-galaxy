class Developer < ActiveRecord::Base
  has_many :store_listings
  
  def store_entry
    @store_entry ||= MarketBot::Play::Developer.new(self.name)
  end
end
