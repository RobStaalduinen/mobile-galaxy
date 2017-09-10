class StoreListing < ActiveRecord::Base

  def parse
    self.update(
      name: app.title,
      package: app.package,
      price: app.price,
      rating: app.rating,
      rating_count: app.votes,
      category: app.category,
      store_url: app.store_url,
      installs: app.installs,
      parsed_at: Time.now
    )
  end

  def app
    @app ||= MarketBot::Play::App.new(self.package).update
  end

end
