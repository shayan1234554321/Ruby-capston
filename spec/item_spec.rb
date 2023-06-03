require_relative '../classes/item'

RSpec.describe Item do
  let(:item_name) { 'Item 1' }
  let(:publish_date) { '2021-01-01' }
  let(:item_id) { 1 }
  let(:item) { Item.new(item_name, publish_date, item_id) }

  describe '#initialize' do
    it 'sets the name, publish_date, and id' do
      expect(item.name).to eq(item_name)
      expect(item.publish_date).to eq(Date.parse(publish_date))
      expect(item.id).to eq(item_id)
    end

    it 'generates a random id if not provided' do
      item = Item.new(item_name, publish_date)

      expect(item.id).to be_a(Integer)
    end

    it 'initializes archived as false' do
      expect(item.archived).to eq(false)
    end
  end

  describe '#add_genre' do
    it 'sets the genre id' do
      genre_id = 1
      item.add_genre(genre_id)

      expect(item.genre).to eq(genre_id)
    end
  end

  describe '#add_author' do
    it 'sets the author id' do
      author_id = 1
      item.add_author(author_id)

      expect(item.author).to eq(author_id)
    end
  end

  describe '#add_label' do
    it 'sets the label id' do
      label_id = 1
      item.add_label(label_id)

      expect(item.label).to eq(label_id)
    end
  end

  describe '#move_to_archive' do
    it 'archives the item if it can be archived' do
      allow(Date).to receive(:today).and_return(Date.parse('2032-01-01'))

      item.move_to_archive

      expect(item.archived).to eq(true)
    end

    it 'does not archive the item if it cannot be archived' do
      future_publish_date = (Date.today + 5).strftime('%Y-%m-%d')
      item = Item.new(item_name, future_publish_date)

      item.move_to_archive

      expect(item.archived).to eq(false)
    end
  end
end
