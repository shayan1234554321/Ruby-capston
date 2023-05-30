class Label
  def initialize(title,color, id)
    id.nil? ? @id = Random.rand(1..10_000) : @id = id
    @title = title
    @color = color
    @items=[]
  end

  def add_item(item)
    @items << item    
  end
end