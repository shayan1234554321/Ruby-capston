require 'date'

class Item
  attr_reader :id, :publish_date, :genre, :author, :source, :label

  def initialize(publish_date, id = nil)
    @id = id.nil? ? Random.rand(1..10_000) : id
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  def add_genre(id)
    @genre = id
  end

  def add_author(id)
    @author = id
  end

  def add_source(id)
    @source = id
  end

  def add_label(id)
    @label = id
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    current_date = Date.today
    @publish_date.year + 10 < current_date.year
  end
end
