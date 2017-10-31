namespace :scraping do
  desc "Begin scraping from a fresh database"
  task start: :environment do
    listing = StoreListing.create(package: "com.Suborbital.CircuitScramble")
    ProcessStoreListingJob.perform_later(listing)
  end
end
