require_relative '../classes/genre'

describe Genre do
  let(:genre) { Genre.new('Horror') }
  let(:item) { Item.new(genre, 'Isaac Asimov', 'Foundation', nil, Time.now) }

  describe '#initialize' do
    it 'creates a new genre with a name and id' do
      expect(genre.name).to eq 'Horror'
      expect(genre.id).to be_between(1, 1000)
    end
  end

  describe '#add_item' do
    it 'adds a new item to the items array' do
      genre.add_item(item)
      expect(genre.items).to include(item)
    end
  end
end
