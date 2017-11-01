namespace :scraping do
  desc "Begin scraping from a fresh database"
  task start: :environment do
    listing = AndroidStoreListing.create(package: "com.Suborbital.CircuitScramble")
    ProcessAndroidListingJob.perform_later(listing)
  end
end
