require 'date'

class Item
  attr_reader :id, :publish_date, :genre, :author, :source, :lable

  def initialize(publish_date)
    @id = Random.rand(1..10000)
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  def set_genre(genre)
    @genre = genre
  end

  def set_author(author)
    @author = author
  end

  def set_source(source)
    @source = source
  end

  def set_lable(lable)
    @lable = lable
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private
  def can_be_archived?
    current_date = Date.today
    @publish_date.year + 10 < current_date.year ? true : false
  end
end