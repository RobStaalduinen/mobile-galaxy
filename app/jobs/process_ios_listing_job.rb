class ProcessIosListingJob < ActiveJob::Base
  queue_as :ios_scraping

  def perform(ios_search_term)
    raise StandardError unless ios_search_term.should_parse?

    ios_search_term.update(parsed_at: Time.now)

    search_results = ITunesSearchAPI.search(term: ios_search_term.name, media: "software") \
                                    .select{ |listing| listing["primaryGenreName"] == "Games" }

    search_results.each do |ios_listing|
      listing = IosStoreListing.create_from_search_result(ios_listing)

      next if listing.blank?

      listing.get_unique_nouns.each do |term|
        search_term = IosSearchTerm.create(name: term) unless IosSearchTerm.where(name: term).count > 0
      end
    end

  rescue

  ensure
    # Queue next job - queueing one at a time reduces load on Redis/memory
   new_term = IosSearchTerm.where("parsed_at < ?", Time.now - 2.weeks).first
   ProcessIosListingJob.perform_later(new_term)
  end

end
