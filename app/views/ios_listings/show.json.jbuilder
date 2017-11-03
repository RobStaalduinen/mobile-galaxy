json.id               rand(1..10000)
json.name             @listing.name
json.package          @listing.package
json.description      @listing.description
json.price            @listing.price
json.rating           @listing.rating
json.rating_count     @listing.rating_count
json.store_url        "www.itunes.com"
json.icon_url         @listing.icon_url

json.recommendations do
  json.array! @recommendations do |recommendation|
    json.id               rand(1..10000)
    json.name             recommendation.name
    json.package          recommendation.name
    json.icon_url         recommendation.icon_url
  end
end
