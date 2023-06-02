require_relative '../lib/filehandler'
require_relative 'game'

class GamesArray
  include FileHandler
  attr_accessor :games

  def initialize
    @games = read_file('games').map do |h|
      Game.new(h['name'], h['publish_date'], h['multiplayer'], h['last_played_at'], h['id'].to_i)
    end
  end

  def new_game(game, mock)
    @games << game
    save @games, 'games' unless mock
  end

  def locate(id)
    @games.select { |game| game.id == id }.pop
  end
end
