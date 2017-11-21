class Game < ApplicationRecord
  attr_reader :players, :game_board, :current_player, :next_player

  def initialize(players, board = GameBoard.new)
    @players = players
    @game_board = board
    @current_player = players[0]
    @next_player = players[1]
  end

  def switch_players
      @current_player, @next_player = @next_player, @current_player
  end
end
