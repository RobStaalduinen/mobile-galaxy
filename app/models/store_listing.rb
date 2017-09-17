class StoreListing < ActiveRecord::Base
  belongs_to :developer, optional: true
  has_many :recommendations

  def parse
    self.update(
      name: app.title,
      package: app.package,
      description: app.description,
      price: app.price,
      rating: app.rating,
      rating_count: app.votes,
      category: app.category,
      store_url: app.store_url,
      cover_image_url: app.cover_image_url
      installs: app.installs,
      parsed_at: Time.now
    )

    self.update(developer: Developer.find_or_create_by({ name: app.developer }))
  end

  def process_similar
    app.similar.each do |s|
      listing = StoreListing.find_or_create_by(package: s[:package])
      self.recommendations.create(recommended_listing: listing, rating: 1)
    end
  end

  def app
    @app ||= MarketBot::Play::App.new(self.package).update
  end

end
