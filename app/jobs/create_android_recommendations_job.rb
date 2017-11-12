class CreateAndroidRecommendationsJob < ActiveJob::Base
  queue_as :recommendations

  def perform(store_listing)
    unique_nouns = store_listing.get_unique_nouns
    unique_adjectives = store_listing.get_unique_adjectives

    current_recommendations = store_listing.all_recommendations

    count = 0

    AndroidStoreListing.where.not(description: nil).each do |potential_listing|
      next if potential_listing == store_listing || current_recommendations.include?(potential_listing)

      noun_score = (unique_nouns & potential_listing.get_unique_nouns).count
      adj_score = (unique_adjectives & potential_listing.get_unique_adjectives).count

      # puts "APP NUMBER: #{potential_listing.id}"
      # puts "NOUN: #{noun_score}"
      # puts "VERB: #{verb_score}"
      # puts "TOTAL: #{noun_score + verb_score}"
      # puts " "
      puts adj_score
      count += 1 if noun_score + adj_score > 10
    end
    puts "COUNT IS #{count}"
  end
end
