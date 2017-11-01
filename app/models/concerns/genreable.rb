module Genreable
  extend ActiveSupport::Concern

  included do
    has_many :app_genres, as: :genreable
    has_many :genres, through: :app_genres  
  end

  def add_genre(genre_name)
    self.app_genres.create(genre: Genre.find_or_create_by(name: genre_name))
  end

end
