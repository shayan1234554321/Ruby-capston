require_relative '../classes/genre'
require_relative '../classes/item'

RSpec.describe Genre do
  let(:genre_name) { 'Rock' }
  let(:item1) { Item.new('Item 1', '2021-01-01') }
  let(:item2) { Item.new('Item 2', '2021-01-02') }

  describe '#initialize' do
    it 'sets the name and id' do
      genre = Genre.new(genre_name, 1)

      expect(genre.name).to eq(genre_name)
      expect(genre.id).to eq(1)
    end

    it 'generates a random id if not provided' do
      genre = Genre.new(genre_name)

      expect(genre.name).to eq(genre_name)
      expect(genre.id).to be_a(Integer)
    end

    it 'initializes the items as an empty array' do
      genre = Genre.new(genre_name)

      expect(genre.items).to eq([])
    end
  end

  describe '#add_item' do
    it 'adds an item to the genre' do
      genre = Genre.new(genre_name)
      genre.add_item(item1)

      expect(genre.items).to eq([item1.id])
    end

    it 'adds multiple items to the genre' do
      genre = Genre.new(genre_name)
      genre.add_item(item1)
      genre.add_item(item2)

      expect(genre.items).to eq([item1.id, item2.id])
    end
  end
end
