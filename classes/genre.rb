require_relative '../classes/item'

class Genre
  attr_accessor :name, :items, :id

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def self.create
    print 'Name: '
    name = gets.chomp
    genre = Genre.new(name)
    puts 'Author created successfully!'
    genre
  end
end
