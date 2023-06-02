require_relative './item'
require_relative './label'

class Book < Item
  attr_accessor :publisher, :label, :cover_state

  def initialize(name, publisher, cover_state, release_date, id = nil)
    @publisher = publisher
    @cover_state = cover_state.downcase
    super(name, release_date, id)
  end

  def add_label(id, labels)
    @label = id
    labels.locate(@label).add_item self
  end

  def can_be_archived?
    super || (@cover_state == 'bad')
  end
end
