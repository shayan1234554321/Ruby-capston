require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(params)
    super(params[:publish_date])
    @genre = params[:genre]
    @author = params[:author]
    @source = params[:source]
    @label = params[:label]
    @on_spotify = params[:on_spotify]
    MusicAlbum.all << self
  end

  def can_be_archived?
    super && @on_spotify
  end

  def self.all
    @all ||= []
  end
end
