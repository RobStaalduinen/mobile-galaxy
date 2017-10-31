class CreateIosSearchTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :ios_search_terms do |t|
      t.string :term, index: true
    end
  end
end
