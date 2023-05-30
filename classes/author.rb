class Author
  def initialize(first_name, last_name, id)
    @id = id.nil? ? Random.rand(1..10_000) : id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
