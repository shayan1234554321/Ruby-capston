require_relative '../classes/author'
require_relative '../classes/item'

describe Author do
  context 'Create instance of class Author' do
    author = Author.new('shayan', 'khan')

    it('should return instance of book class') do
      expect(author).to be_instance_of(Author)
    end

    it('Should add item') do
      item = Item.new('2022-2-2')
      author.add_item(item)
      expect(author.items.length).to be(1)
    end
  end
end
