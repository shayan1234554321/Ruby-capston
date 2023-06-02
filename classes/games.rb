require_relative '../lib/filehandler'

class GamesArray
  include FileHandler
  attr_accessor :games

  def initialize
    @games = read_file('games').map do |h|
      Game.new(h['publish_date'], h['multiplayer'], h['last_played_at'], h['id'].to_i)
    end
  end

  def new_game(game)
    @games << game
    save @games, 'games'
  end

  def locate(id)
    @games.select { |game| game.id == id }.pop
  end
end
