require_relative '../classes/games'
require_relative '../classes/game'
require_relative '../classes/item'

describe GamesArray do
  context 'Create instance of class Authors' do
    games = GamesArray.new

    it('should return instance of Authors class') do
      expect(games).to be_instance_of(GamesArray)
    end

    it('Should add item') do
      game = Game.new('PUBG', '2022-2-2', true, '2022-4-3')
      lengthBefore = games.games.length
      games.new_game(game, true)
      expect(games.games.length).to be(lengthBefore + 1)
    end
  end
end
