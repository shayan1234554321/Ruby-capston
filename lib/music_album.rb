require_relative '../classes/item'

class MusicAlbum < Item
  attr_accessor :title, :artist, :genre, :release_date, :label, :on_spotify

  def initialize(params)
    super()
    @title = params[:title]
    @artist = params[:artist]
    @genre = params[:genre]
    @release_date = params[:release_date]
    @label = params[:label]
    @on_spotify = params[:on_spotify]
  end

  def can_be_archived?
    super && @on_spotify
  end
end
