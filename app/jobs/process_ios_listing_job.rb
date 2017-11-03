class ProcessIosListingJob < ActiveJob::Base
  queue_as :ios_scraping

  def perform(ios_search_term)
    return nil unless ios_search_term.should_parse?

    ios_search_term.update(parsed_at: Time.now)

    search_results = ITunesSearchAPI.search(term: ios_search_term.name, media: "software") \
                                    .select{ |listing| listing["primaryGenreName"] == "Games" }

    search_results.each do |ios_listing|
      listing = IosStoreListing.create_from_search_result(ios_listing)

      next if listing.blank?

      listing.get_unique_nouns.each do |term|
        search_term = IosSearchTerm.create(name: term)
        search_term.process
      end
    end
  end

end
