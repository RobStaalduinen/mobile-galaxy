class AppGenre < ActiveRecord::Base
  belongs_to :genreable, polymorphic: true
  belongs_to :genre
end
