require_relative '../classes/author'
require_relative '../classes/item'

describe Author do
  context 'Create instance of class Author' do
    author = Author.new('shayan', 'khan')

    it('should return instance of Author class') do
      expect(author).to be_instance_of(Author)
    end

    it('Should add item') do
      author.add_item('445')
      expect(author.items.length).to be(1)
    end
  end
end
