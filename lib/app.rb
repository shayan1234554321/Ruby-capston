require_relative '../classes/genres'
require_relative '../classes/games'
require_relative '../classes/game'
require_relative '../classes/authors'
require_relative '../classes/author'
require_relative '../classes/music_albums'
require_relative '../classes/books'
require_relative '../classes/labels'
require_relative 'filehandler'
require_relative 'listhandler'

class App
  attr_accessor :genres, :music_albums, :games, :authors

  include FileHandler
  include ListHandler

  def initialize
    @books = BooksArray.new
    @labels = LabelsArray.new
    @games = GamesArray.new
    @authors = AuthorArray.new
    @music_albums = MusicAlbumsArray.new
    @genres = GenresArray.new
  end

  def list_all_books
    puts 'Books list'
    list_obj_arr(@books.books, %w[id name publisher label publish_date archived])
  end

  def list_all_music_albums
    puts 'Music Albuns list'
    list_obj_arr(@music_albums.music_albums, %w[id name on_spotify genre publish_date archived])
  end

  def list_all_games
    if @games.games.empty?
      p 'No games at the moment'
    else
      p 'The list of games'
      @games.games.each do |game|
        puts "Name: #{game.name}"
        puts " - Publish Date: #{game.publish_date}"
        puts " - Multiplayer: #{game.multiplayer}"
        puts " - Last Played at: #{game.last_played_at}"
        puts ' '
      end
    end
  end

  def list_all_generes
    puts 'Genres list'
    list_obj_arr(@genres.genres, %w[id name])
  end

  def list_all_labels
    puts 'Label List'
    list_obj_arr(@labels.labels, %w[id title color])
    # puts @labels.labels
  end

  def list_all_authors
    if @authors.authors.empty?
      p 'No author at the moment'
    else
      p 'The list of authors'
      @authors.authors.each do |author|
        puts " - First Name: #{author.first_name}"
        puts "   Last Name: #{author.last_name}"
        puts ' '
      end
    end
  end

  def add_a_book
    puts 'Add new book'
    @books.create_book @labels
  end

  def add_a_music_album
    puts 'Add new Music Album'
    @music_albums.create_music_album @genres
  end

  def add_a_game
    puts 'Whats the name of your game '
    name = gets.chomp
    puts 'When is it published '
    publish_date = gets.chomp
    puts 'Is it a multiplayer game ? '
    multiplayer = gets.chomp
    puts 'When was it last played ? '
    last_played_at = gets.chomp
    puts 'Whats the first name of game author'
    first_name = gets.chomp
    puts 'Whats the last name of game author'
    last_name = gets.chomp

    game = Game.new(name, publish_date, multiplayer, last_played_at)
    author = Author.new(first_name, last_name)

    game.add_author(author.id)
    author.add_item(game.id)

    @authors.new_author(author, false)
    @games.new_game(game, false)
    puts 'Created author and game'
  end
end
