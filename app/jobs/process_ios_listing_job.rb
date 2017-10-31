class ProcessIosListingJob < ActiveJob::Base
  queue_as :ios_scraping

  def perform(search_term)
    ios_search_term = IosSearchTerm.find_or_create_by(term: search_term)
    return nil if ios_search_term.parsed_at >= Time.now - 1.week

    ios_search_term.update(parsed_at: Time.now)

    ITunesSearchAPI.search(term: search_term, media: "software").each do |ios_listing|
      listing = IosStoreListing.create_from_search_result(ios_listing)

      next unless listing.present?

      listing.similar_search_terms.each do |term|
        ProcessIosListingJob.perform_later(term)
      end
    end
  end

end
