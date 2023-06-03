require_relative '../classes/label'

RSpec.describe Label do
  let(:label_title) { 'Label 1' }
  let(:label_color) { 'Red' }
  let(:label_id) { 1 }
  let(:label) { Label.new(label_title, label_color, label_id) }

  describe '#initialize' do
    it 'sets the title, color, and id' do
      expect(label.title).to eq(label_title)
      expect(label.color).to eq(label_color)
      expect(label.id).to eq(label_id)
    end

    it 'generates a random id if not provided' do
      label = Label.new(label_title, label_color)

      expect(label.id).to be_a(Integer)
    end

    it 'initializes items as an empty array' do
      expect(label.items).to eq([])
    end
  end

  describe '#add_item' do
    it 'adds an item to the label' do
      item = double('item', id: 1)
      label.add_item(item)

      expect(label.items).to eq([1])
    end
  end
end
