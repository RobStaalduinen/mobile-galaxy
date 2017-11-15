require 'httparty'

class Itunes
  include HTTParty
  base_uri 'https://itunes.apple.com'
  format :json

  class << self
    def search(query={})
      query_string = "?term=#{URI.encode(query[:term])}"
      query_string += "&media=#{query[:media]}" if query[:media].present?
      query_string += "&limit=#{URI.encode(query[:limit].to_s)}" if query[:limit].present?
      query_string += "&offset=#{query[:offset]}" if query[:offset].present?
      get("/search#{query_string}")["results"]
    end

    def lookup(query={})
      get("/lookup", :query => query)["results"]
    end
  end
end
