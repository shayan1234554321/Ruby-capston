require_relative '../classes/books'
require_relative '../classes/book'

# mock filehandler store internally, doesn't create file
module FileHandler
  def save(collection, filename)
    data = []
    collection.each do |item|
      puts item
      object = {}
      item.instance_variables.each do |var|
        object[var.to_s.delete('@')] = item.instance_variable_get(var).to_s
      end
      data.push(object)
    end
    @filename = JSON.generate(data)
    filename
  end

  def read_file(_filename)
    @filename = [{ 'publisher' => 'p', 'cover_state' => 'bad', 'id' => '6868', 'publish_date' => '2022-01-01',
                   'archived' => 'true' }]
    JSON.parse(@filename)
  end
end

describe BooksArray do
  b = Book.new 'p', 'good', '2020-1-1'
  bs = BooksArray.new
  bs.new_book b
  it 'contains empty array' do
    expect(bs.books).to be_a Array
  end
end
