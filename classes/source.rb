class Source
  def initialize(name, id)
    id.nil? ? @id = Random.rand(1..10_000) : @id = id
    @name = name
    @items=[]
  end

  def add_item(item)
    @items << item    
  end
end