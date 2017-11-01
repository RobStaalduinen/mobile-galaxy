class CreateIosSearchTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :ios_search_terms do |t|
      t.string :name, index: true
      t.datetime :parsed_at, default: Time.at(0)
    end
  end
end
