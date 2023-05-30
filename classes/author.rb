class Author
  def initialize(first_name, last_name, id)
    id.nil? ? @id = Random.rand(1..10_000) : @id = id
    @first_name = first_name
    @last_name = last_name
    @items=[]
  end

  def add_item(item)
    @items << item    
  end
end