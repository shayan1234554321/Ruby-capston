require_relative '../lib/filehandler'
require_relative '../lib/listhandler'
require_relative './book'

class BooksArray
  include FileHandler
  include ListHandler
  attr_accessor :books

  def initialize
    @books = read_file('books').map do |h|
      Book.new(h['name'],h['publisher'], h['cover_state'], h['publish_date'], h['id'].to_i)
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
    puts "Add new book"
    print "Title: "
    name = gets.chop
    print "Publisher: "
    publisher = gets.chomp
    print 'Cover State (good/regular/bad): '
    cover_state = gets.chomp
    print 'Release Date (yyyy-m-d): '
    release_date = gets.chomp
    
    puts 'Select a Label from the list'
    list_obj_arr(labels, ['title', 'color','id'])
    print "Select Item number or 'n' to create a new one: "
    label_index = gets.chomp   
    if label_index == 'n' do
      labels.create_label
      list_obj_arr(labels, ['title', 'color','id'])
      print 'Select Item number: '
      label_index = gets.chomp
    end
    
    book = Book.new(name, publish_date, cover_state)
    book.add_label labels.labels[label_index].id labels
    new_book book
    puts 'book entry created successfully'    
  end
end
