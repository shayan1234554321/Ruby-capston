class Label
  def initialize(title, color, id)
    @id = id.nil? ? Random.rand(1..10_000) : id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
