require 'date'

class Item
  attr_reader :id, :publish_date, :genre, :author, :source, :lable

  def initialize(publish_date, id)
    id.nil? ? @id = Random.rand(1..10_000) : @id = id
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  def set_genre(id)
    @genre = id
  end

  def set_author(id)
    @author = id
  end

  def set_source(id)
    @source = id
  end

  def set_lable(id)
    @lable = id
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
