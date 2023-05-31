class Label
  attr_reader :id, :title, :color, :items

  def initialize(title, color, id = ni)
    @id = id.nil? ? Random.rand(1..10_000) : id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
