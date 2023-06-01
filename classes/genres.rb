require_relative '../lib/filehandler'

class GenresArray
  include FileHandler
  attr_accessor :name, :items, :id

  def initialize
    @genres = read_file('genres').map do |h|
      Genre.new(h['name'], h['id'].to_i)
    end
  end

  def new_genre(genre)
    @genres << genre
    save @gemres, 'genres'
  end

  def locate(id)
    @genres.select { |genre| genre.id == id }.pop
  end

  def self.create
    print 'Name: '
    name = gets.chomp
    genre = Genre.new(name)
    puts 'Author created successfully!'
    genre
  end
end
