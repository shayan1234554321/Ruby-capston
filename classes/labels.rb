require_relative '../lib/filehandler'
require_relative './label'

class LabelsArray
  include FileHandler
  attr_accessor :labels

  def initialize
    @labels = read_file('labels').map do |h|
      Label.new(h['title'], h['color'], h['id'].to_i)
    end
  end

  def new_label(label)
    @labels << label
    save @labels, 'labels'
  end

  def locate(id)
    @labels.select { |label| label.id == id }.pop
  end

  def create_label
    puts 'Create a new label'
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp

    label = Label.new(title, color)
    new_label label
  end
end
