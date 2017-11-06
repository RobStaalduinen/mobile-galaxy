class AndroidStoreListing < ActiveRecord::Base
  include Genreable
  include Parseable

  scope :parsed, -> { where.not(parsed_at: nil) }
  belongs_to :developer, optional: true
  # has_many :recommendations

  def parse
    self.update(
      name: app.title,
      package: app.package,
      description: app.description,
      price: app.price,
      rating: app.rating,
      rating_count: app.votes,
      store_url: app.store_url,
      cover_image_url: app.cover_image_url,
      installs: app.installs,
      parsed_at: Time.now
    )

    self.add_genre(app.category)
    
    self.update(developer: Developer.find_or_create_by({ name: app.developer }))
  end

  def process_similar
    app.similar.each do |s|
      listing = AndroidStoreListing.find_or_create_by(package: s[:package])
    end
  end

  def app
    @app ||= MarketBot::Play::App.new(self.package).update
  end

  def should_parse?
    return true unless self.parsed_at.present? && self.parsed_at >= Time.now - 1.week
  end

  validates :package, presence: true
end
