class Author
  attr_reader :items, :id, :first_name, :last_name

  def initialize(first_name, last_name, id = nil, items = [])
    @id = id.nil? ? Random.rand(1..10_000) : id
    @first_name = first_name
    @last_name = last_name
    @items = items
  end

  def add_item(id)
    @items << id
  end
end
