require_relative '../classes/authors'
require_relative '../classes/author'
require_relative '../classes/item'

describe AuthorArray do
  context 'Create instance of class Authors' do
    authors = AuthorArray.new

    it('should return instance of Authors class') do
      expect(authors).to be_instance_of(AuthorArray)
    end

    it('Should add item') do
      author = Author.new('shayan', 'khan')
      lengthBefore = authors.authors.length
      authors.new_author(author, true)
      expect(authors.authors.length).to be(lengthBefore + 1)
    end
  end
end
