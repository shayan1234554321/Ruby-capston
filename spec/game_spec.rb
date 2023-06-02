require_relative '../classes/game'

describe Game do
  context 'Create instance of class Game' do
    game = Game.new('PUBG', '2022-2-2', true, '2022-4-3')

    it('should return instance of game class') do
      expect(game).to be_instance_of(Game)
    end

    it('Should add author') do
      game.add_author(334)
      expect(game.author).to be(334)
    end

    it('Should not be archieved and return false') do
      expect(game.can_be_archived?).to be(false)
    end
  end
end
