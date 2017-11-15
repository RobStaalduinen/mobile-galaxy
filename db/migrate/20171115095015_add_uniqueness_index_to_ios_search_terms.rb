class AddUniquenessIndexToIosSearchTerms < ActiveRecord::Migration[5.1]
  def change
    IosSearchTerm.group(:name).count.select{ |term, count| count > 1 }.each do |term, count|
      IosSearchTerm.where(name: term).limit(count - 1).destroy_all
    end
    
    add_index :ios_search_terms, :name, unique: true 
  end
end
