namespace :scraping do
  desc "Begin scraping from a fresh database"
  task start: :environment do
    android_listing = AndroidStoreListing.create(package: "com.Suborbital.CircuitScramble")
    ProcessAndroidListingJob.perform_later(android_listing)

    ios_search_term = IosSearchTerm.create(name: "Crossy")
    ProcessIosListingJob.perform_later(ios_search_term)
  end
end
