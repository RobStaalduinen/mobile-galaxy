class IosStoreListing < ActiveRecord::Base
  include Genreable
  include Parseable
  
  belongs_to :developer, optional: true
  # has_many :recommendations

  scope :parsed, -> { where.not(parsed_at: nil) }

  def self.create_from_search_result(result)
    listing = IosStoreListing.find_by(package: result["bundleId"]) || IosStoreListing.new

    return nil unless listing.should_parse?
                  
    listing.update(
      name: result["trackName"],
      package: result["bundleId"],
      description: result["description"],
      icon_url: result["artworkUrl100"],
      price: result["price"],
      rating: result["averageUserRating"],
      rating_count: result ["userRatingCount"],
      track_number: result["trackId"],
      developer: Developer.find_or_create_by(name: result["artistName"]),
      parsed_at: Time.now
    )

    listing.process_genres(result["genres"])

    listing.save

    listing
  end

  def process_genres(genre_list)
    genre_list.reject {|genre| genre == "Games"}.each { |genre_name| add_genre(genre_name) }
  end

  def should_parse?
    return true unless self.parsed_at.present? && self.parsed_at >= Time.now - 1.week
  end

end
