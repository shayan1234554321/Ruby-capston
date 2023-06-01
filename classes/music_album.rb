require_relative 'item'

class MusicAlbum < Item
  attr_accessor :title, :artist, :genre, :release_date, :label, :on_spotify

  def initialize(release_date, on_spotify)
    super(release_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
