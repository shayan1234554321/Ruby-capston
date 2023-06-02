require_relative '../lib/filehandler'
require_relative 'author.rb'

class AuthorArray
  include FileHandler
  attr_accessor :authors

  def initialize
    @authors = read_file('authors').map do |h|
      Author.new(h['first_name'], h['last_name'], h['id'].to_i)
    end
  end

  def new_author(author , mock = false)
    @authors << author
    save @authors, 'authors' if !mock
  end

  def locate(id)
    @authors.select { |author| author.id == id }.pop
  end
end
