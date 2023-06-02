require_relative '../classes/genre'
require_relative '../classes/games'
require_relative '../classes/game'
require_relative '../classes/authors'
require_relative '../classes/author'
require_relative '../classes/music_album'

require_relative 'filehandler'

class App
  attr_accessor :genres, :music_albums, :games, :authors

  include FileHandler

  def initialize
    @games = Games.new

    Genre.load
    MusicAlbum.load

    @genres = Genre.all
    @music_albums = MusicAlbum.all
  end

  # def list_genres
  #   if @genres.empty?
  #     puts 'No genres registered.'
  #   else
  #     puts '### Genres ###'
  #     @genres.each_with_index { |genre, index| puts "#{index + 1} - #{genre.name}" }
  #   end
  # end

  # def list_music_albums
  #   if @music_albums.empty?
  #     puts 'No albums found.'
  #   else
  #     puts '### Music Albums ###'
  #     @music_albums.each do |album|
  #       puts "
  #     Genre: #{album.genre}
  #     Publish Date: #{album.publish_date}
  #     On Spotify: #{album.on_spotify}"
  #     end
  #   end
  # end

  # def add_genre
  #   Genre.create
  # end

  # def add_music_album
  #   MusicAlbum.create
  # end

  def list_all_books
    puts 'listing all books here'
  end

  def list_all_music_albums
    puts 'listing all music here'
  end
  def list_all_games 
    puts "listing all games here"
  end

  def list_all_generes
    puts 'listing all generes here'
  end

  def list_all_labels
    puts 'listing all labels here'
  end
  def list_all_authors 
    puts "listing all authors here"
  end

  def add_a_book
    puts 'add a book here'
  end

  def add_a_music_album
    puts 'add a music here'
  end
  def add_a_game 
    puts "add a game here"
  end
end
