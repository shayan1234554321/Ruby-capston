require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :author

  def initialize(name, publish_date, multiplayer, last_played_at, id = nil)
    super(name, publish_date, id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def add_author(id)
    @author = id
  end

  def can_be_archived?
    super && (@last_played_at.year + 2) < Date.today.year
  end
end
