require_relative '../classes/genre'
require_relative '../classes/music_album'

require '../file_handler'

class App
  attr_accessor :genres, :music_albums

  include FileHandler

  def initialize
    Genre.load
    MusicAlbum.load

    @genres = Genre.all
    @music_albums = MusicAlbum.all
  end

  def list_genres
    if @genres.empty?
      puts 'No genres registered.'
    else
      puts '### Genres ###'
      @genres.each_with_index { |genre, index| puts "#{index + 1} - #{genre.name}" }
    end
  end

  def list_music_albums
    if @music_albums.empty?
      puts 'No albums found.'
    else
      puts '### Music Albums ###'
      @music_albums.each do |album|
        puts "
      Genre: #{album.genre}
      Publish Date: #{album.publish_date}
      On Spotify: #{album.on_spotify}"
      end
    end
  end

  def add_genre
    Genre.create
  end

  def add_music_album
    MusicAlbum.create
  end

  def exit
    FileHandler.save(@genres, 'genres.json') if @genres.any?
    FileHandler.save(@music_albums, 'music_albums.json') if @music_albums.any?
    puts 'Thanks for using this app!'
    exit!
  end
end
