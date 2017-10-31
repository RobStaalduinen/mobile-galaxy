class ProcessStoreListingJob < ActiveJob::Base
  queue_as :android_scraping

  def perform(store_listing)
    store_listing.parse
    store_listing.process_similar

    next_job = StoreListing.where(parsed_at: nil).first
    ProcessStoreListingJob.set(wait: 1.second).perform_later(next_job)
  end
end
