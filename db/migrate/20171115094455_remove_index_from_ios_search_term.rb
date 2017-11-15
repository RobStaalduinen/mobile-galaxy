class RemoveIndexFromIosSearchTerm < ActiveRecord::Migration[5.1]
  def change
    remove_index :ios_search_terms, :name   
  end
end
