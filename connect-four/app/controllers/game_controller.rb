class GameController < ApplicationController
  def new
    p1 = Player.new({value: 1, name: "Player 1"})
    p2 = Player.new({value: 2, name: "Player 2"})
    @game = Game.new([p1, p2])
  end

  def move
    # the current player places coin
    @game.game_board
    # check if game is won
    # swap players turns
    game.swap_players
    # the new current player places coin
  end
end
