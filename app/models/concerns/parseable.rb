module Parseable
  extend ActiveSupport::Concern
  
  def get_unique_nouns
    tagger.get_nouns(tagged_description).keys.each{ |word| word.downcase }.uniq
  end

  def get_unique_verbs
    tagger.get_verbs(tagged_description).keys.each{ |word| word.downcase }.uniq
  end 

  def get_unique_adjectives
    tagger.get_adjectives(tagged_description).keys.each{ |word| word.downcase }.uniq
  end 
  
  def tagged_description
    @tagged ||= tagger.add_tags(self.description)
  end

  def tagger
    @tagger ||= EngTagger.new
  end
end
