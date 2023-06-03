require_relative '../classes/item'

class Genre
  attr_accessor :name, :items, :id

  def initialize(name, id = nil)
    @id = id.nil? ? Random.rand(1..10_000) : id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item.id
  end
end
