json.array! @listings.each do |listing|
  json.id         rand(1..10000)
  json.name       listing.name
  json.icon_url   listing.icon_url
end
