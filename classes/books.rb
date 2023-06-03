require_relative '../lib/filehandler'
require_relative '../lib/listhandler'
require_relative './book'

class BooksArray
  include FileHandler
  include ListHandler
  attr_accessor :books

  def initialize
    @books = read_file('books').map do |h|
      b = Book.new(h['name'], h['publisher'], h['cover_state'], h['publish_date'], h['id'].to_i)
      b.label = h['label']
      b
    end
  end

  def new_book(book)
    @books << book
    save @books, 'books'
  end

  def locate(id)
    @books.select { |book| book.id == id }.pop
  end

  def create_book(labels)
    print 'Title: '
    name = gets.chop
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover State (good/regular/bad): '
    cover_state = gets.chomp
    print 'Publish Date (yyyy-m-d): '
    publish_date = gets.chomp
    puts 'Select a Label from the list'
    list_obj_arr(labels.labels, %w[title color id])
    print "Select Item number or 'n' to create a new one: "
    label_index = gets.chomp
    if label_index == 'n'
      labels.create_label
      label_index = (labels.labels.length - 1).to_s
    end
    book = Book.new(name, publisher, cover_state, publish_date)
    book.add_label labels.labels[label_index.to_i].id, labels
    new_book book
  end
end
