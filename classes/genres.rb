require_relative '../lib/filehandler'
require_relative './genre'

class GenresArray
  include FileHandler
  attr_accessor :name, :items, :genres, :id

  def initialize
    @genres = read_file('genres').map do |h|
      Genre.new(h['name'], h['id'].to_i)
    end
  end

  def new_genre(genre)
    @genres << genre
    save @genres, 'genres'
  end

  def locate(id)
    @genres.select { |genre| genre.id == id }.pop
  end

  def create_genre
    puts 'Create a new genre'
    print 'name: '
    name = gets.chomp

    genre = Genre.new(name)
    new_genre genre
  end
end
