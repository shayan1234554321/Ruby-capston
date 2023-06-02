require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at, id = nil)
    super(publish_date, id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def add_author(id, authors)
    @author = id
    authors.locate(@author).add_item self
  end

  def can_be_archived?
    super && (@last_played_at.year + 2) < Date.today.year
  end
end
