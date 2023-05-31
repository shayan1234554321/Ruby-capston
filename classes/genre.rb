require_relative '../classes/item'

class Genre
  attr_accessor :name, :items, :id

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
    Genre.all << self
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def self.all
    @all ||= []
  end

  def self.create
    print 'Name: '
    name = gets.chomp
    genre = Genre.new(name)
    puts 'Author created successfully!'
    genre
  end

  def self.load
    return unless File.exist?('./data/genres.json')

    genres = FileHandler.read_file('./data/genres.json')
    genres.map do |genre_hash|
      Genre.new(genre_hash['name'])
    end
  end
end