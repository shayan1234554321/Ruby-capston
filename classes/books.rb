require_relative '../lib/filehandler'

class BooksArray
  include FileHandler
  attr_accessor :books

  def initialize
    @books = read_file('books').map do |h|
      Book.new(h['publisher'], h['cover_state'], h['publish_date'], h['id'].to_i)
    end
  end

  def new_book(book)
    @books << book
    save @books, 'books'
  end

  def locate(id)
    @books.select { |book| book.id == id }.pop
  end
end
