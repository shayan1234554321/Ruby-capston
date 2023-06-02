class Author
  attr_reader :items

  def initialize(first_name, last_name, id = nil)
    @id = id.nil? ? Random.rand(1..10_000) : id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item.id
  end
end
