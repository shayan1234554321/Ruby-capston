require_relative '../classes/book'

describe Book do
  bgood = Book.new('publisher', 'good', '2020-1-1')
  bbad = Book.new('publisher', 'bad', '2020-1-1')
  bold = Book.new('publisher', 'good', '2000-1-1')

  it 'should be instance of Book and kind of Item' do
    expect(bgood).to be_instance_of(Book)
    expect(bgood).to be_kind_of(Item)
  end

  it 'to contain data' do
    expect(bgood.publisher).to eq('publisher')
    expect(bgood.publish_date).to be_a Date
    expect(bgood.id).to be_a Integer
  end

  it 'archived is false before move' do
    expect(bgood.archived).to be false
    expect(bbad.archived).to be false
    expect(bold.archived).to be false
  end

  it 'Moves to archive correctly' do
    bgood.move_to_archive
    bbad.move_to_archive
    bold.move_to_archive
    expect(bgood.archived).to be false
    expect(bbad.archived).to be true
    expect(bold.archived).to be true
  end
end
