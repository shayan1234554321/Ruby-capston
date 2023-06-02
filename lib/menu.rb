class Menu

  attr_accessor :options , :app

  def initialize(app)
    @app = app
    @options = {
      '1' => :list_all_books ,
      '2' => :list_all_music_albums ,
      '3' => :list_all_games ,
      '4' => :list_all_generes ,
      '5' => :list_all_labels ,
      '6' => :list_all_authors ,
      '7' => :add_a_book ,
      '8' => :add_a_music_album ,
      '9' => :add_a_game
    }.freeze
  end

  def display_options
    puts "
    Display:
      1 - List all books
      2 - List all music albums
      3 - List all games
      4 - List all genres
      5 - List all labels
      6 - List all authors
      7 - Add a book
      8 - Add a music album
      9 - Add a game
      0 - Exit
    "
  end

  def perform_action(choice)
    send(options[choice.to_s])
  end

  def list_all_books 
    @app.list_all_books
  end

  def list_all_music_albums
    @app.list_all_music_albums
  end

  def list_all_games 
    @app.list_all_games
  end
  
  def list_all_generes
    @app.list_all_generes
  end

  def list_all_labels 
    @app.list_all_labels
  end

  def list_all_authors
    @app.list_all_authors
  end

  def add_a_book 
    @app.add_a_book
  end

  def add_a_music_album
    @app.add_a_music_album
  end

  def add_a_game
    @app.add_a_game
  end
end
