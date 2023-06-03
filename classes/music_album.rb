require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :genre

  def initialize(name, on_spotify, publish_date, id = nil)
    @genre = genre
    @on_spotify = on_spotify
    super(name, publish_date, id)
  end

  def add_genre(id, genres)
    @genre = id
    genres.locate(@genre).add_item self
  end

  def can_be_archived?
    super && @on_spotify
  end
end
