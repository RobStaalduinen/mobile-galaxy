class ProcessIosListingJob < ActiveJob::Base
  queue_as :ios_scraping

  def perform(search_term)
    return nil if IosSearchTerm.where(term: search_term).any?

    IosSearchTerm.create(term: search_term)

    ITunesSearchAPI.search(term: search_term, media: "software").each do |ios_listing|
      listing = IosStoreListing.create_from_search_result(ios_listing)

      next unless listing.present?

      listing.similar_search_terms.each do |term|
        ProcessIosListingJob.perform_later(term)
      end
    end
  end
  
end
