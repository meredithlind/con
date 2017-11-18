class GameController < ApplicationController
  def new
    p1 = Player.new({value: 1, name: "Player 1"})
    p2 = Player.new({value: 2, name: "Player 2"})
    @game = Game.new([p1, p2])
  end
end
