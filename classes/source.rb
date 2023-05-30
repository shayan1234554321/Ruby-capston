class Source
  def initialize(name, id)
    @id = id.nil? ? Random.rand(1..10_000) : id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
