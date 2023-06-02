require_relative '../classes/genre'
require_relative '../classes/games'
require_relative '../classes/music_album'
require_relative '../classes/books'
require_relative '../classes/labels'
require_relative 'filehandler'

class App
  attr_accessor :genres, :music_albums, :games

  include FileHandler

  def initialize
    @games = GamesArray.new
    @books = BooksArray.new
    # Genre.load
    # MusicAlbum.load

    # @genres = Genre.all
    # @music_albums = MusicAlbum.all
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
    puts 'Books list'
    listObjArr books.books, [id, name, publisher, label, publish_date, archived]
  end

  def list_all_music_albums
    puts 'listing all music here'
  end

  def list_all_games
    puts 'listing all games here'
  end

  def list_all_generes
    puts 'listing all generes here'
  end

  def list_all_labels
    puts 'Label List'
    listObjArr labels.labels [id, title, color]
  end

  def list_all_authors
    puts 'listing all authors here'
  end

  def add_a_book
    puts 'add a book here'
  end

  def add_a_music_album
    puts 'add a music here'
  end

  def add_a_game
    puts 'add a game here'
  end
end
