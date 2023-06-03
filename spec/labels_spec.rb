require_relative '../classes/labels'
require_relative '../classes/label'

# Stub filehandler doesn't create file and provide data to test
module FileHandler
  def save(collection, filename)
    @collection = collection
    @filename = filename
  end

  def read_file(_filename)
    JSON.parse(
      '[{"title":"t0","color":"c0","id":"100"}]'
    )
  end
end

describe LabelsArray do
  l = Label.new 't', 'c'
  ls = LabelsArray.new

  it 'reads from filehandler on initialize' do
    expect(ls.labels).to be_a Array
    expect(ls.labels.empty?).to be false
    expect(ls.labels[0].title).to eq('t0')
  end

  it 'initialize creates a Label instance' do
    expect(ls.labels[0]).to be_a Label
  end

  it 'new_label adds a label to the array' do
    expect(ls.labels.length).to eq(1)
    ls.new_label l
    expect(ls.labels.length).to eq(2)
  end

  it 'locate method can locate label by id' do
    expect(ls.locate(100)).to be_a Label
    expect(ls.locate(100).id).to eq(100)
  end
end
