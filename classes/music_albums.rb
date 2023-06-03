require_relative '../lib/filehandler'
require_relative '../lib/listhandler'
require_relative './music_album'

class MusicAlbumsArray
  include FileHandler
  include ListHandler
  attr_accessor :music_albums

  def initialize
    @music_albums = read_file('music_albums').map do |h|
      m = MusicAlbum.new(h['name'], h['on_spotify'], h['publish_date'], h['id'].to_i)
      m.genre = h['genre']
      m
    end
  end

  def new_music_album(music_album)
    @music_albums << music_album
    save @music_albums, 'music_albums'
  end

  def locate(id)
    @music_albums.select { |music_album| music_album.id == id }.pop
  end

  def create_music_album(genres)
    print 'Name: '
    name = gets.chop
    print 'On Spotify y/n: '
    on_spotify = gets.chomp == 'y'
    print 'Publish Date (yyyy-m-d): '
    publish_date = gets.chomp
    puts 'Select a genre from the list'
    list_obj_arr(genres.genres, %w[name id])
    print "Select Item number or 'n' to create a new one: "
    genre_index = gets.chomp
    if genre_index == 'n'
      genres.create_genre
      genre_index = (genres.genres.length - 1).to_s
    end
    music_album = MusicAlbum.new(name, on_spotify, publish_date)
    music_album.add_genre genres.genres[genre_index.to_i].id, genres
    new_music_album music_album
  end
end
