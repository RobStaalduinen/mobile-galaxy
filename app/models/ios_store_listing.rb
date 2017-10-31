class IosStoreListing < ActiveRecord::Base
  belongs_to :developer, optional: true
  has_many :ios_genres
  has_many :genres, through: :ios_genres
  has_many :students, :through => :course_students
  # has_many :recommendations

  scope :parsed, -> { where.not(parsed_at: nil) }

  def self.create_from_search_result(result)
    # Filter out already created apps and non-game apps
    return nil if IosStoreListing.where(bundle: result["bundleId"]).count > 0 ||
                  result["primaryGenreName"] != "Games"

    listing = IosStoreListing.create(
      name: result["trackName"],
      bundle: result["bundleId"],
      description: result["description"],
      icon_url: result["artworkUrl100"],
      price: result["price"],
      rating: result["averageUserRating"],
      rating_count: result ["userRatingCount"],
      track_number: result["trackId"],
      parsed_at: Time.now
    )

    result["genres"].reject {|genre| genre == "Games"}.each do |genre|
      IosGenre.create(
        genre: Genre.find_or_create_by(name: genre),
        ios_store_listing: listing
      )
    end

    listing.update(developer: Developer.find_or_create_by({ name: result["artistId"] }))

    listing
  end

  def similar_search_terms
    text_tagger = EngTagger.new
    tagged = text_tagger.add_tags(self.description)
    text_tagger.get_nouns(tagged).keys.each{ |key| key.downcase }.uniq
  end
end
