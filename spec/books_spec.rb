require_relative '../classes/books'
require_relative '../classes/book'

# Stud filehandler doesn't create file and provide data to test
module FileHandler
  def save(collection, filename)
    @collection = collection
    @filename = filename
  end

  def read_file(_filename)
    JSON.parse(
      '[{"publisher":"p","cover_state":"good","id":"8903","name":"n","publish_date":"2020-01-01","archived":"false"}]'
    )
  end
end

describe BooksArray do
  b = Book.new 'n', 'p', 'good', '2020-1-1'
  bs = BooksArray.new
  # bs.new_book b
  it 'reads from filehandler on initialize' do
    expect(bs.books).to be_a Array
    expect(bs.books.empty?).to be false
    expect(bs.books[0].name).to eq('n')
  end

  it 'initialize creates a book instance' do
    expect(bs.books[0]).to be_a Book
  end

  it 'new_book adds a book to the array' do
    expect(bs.books.length).to eq(1)
    bs.new_book b
    expect(bs.books.length).to eq(2)
  end

  it 'locate method can locate book by id' do
    expect(bs.locate(8903)).to be_a Book
    expect(bs.locate(8903).id).to eq(8903)
  end
end
