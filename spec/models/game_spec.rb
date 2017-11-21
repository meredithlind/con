require 'rails_helper'

RSpec.describe Game, type: :model do

  let (:p1) { Player.new({value: 1, name: "Player 1"}) }
  let (:p2) { Player.new({value: 2, name: "Player 2"}) }

  context "#initialize" do
    it "creates a game and sets players" do
      game = Game.new([p1, p2])
      expect(game.players).to eq([p1, p2])
      expect(game.current_player).to eq(p1)
      expect(game.next_player).to eq(p2)
    end
  end

  context "#switch_players" do
    it "will set @current_player to @next_player" do
      game = Game.new([p1, p2])
      next_player = game.next_player
      game.switch_players
      expect(game.current_player).to eq next_player
    end

    it "will set @next_player to @current_player" do
      game = Game.new([p1, p2])
      current_player = game.current_player
      game.switch_players
      expect(game.next_player).to eq current_player
    end
  end
end
