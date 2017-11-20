class GameController < ApplicationController
  def new
    p1 = Player.new({value: 1, name: "Player 1"})
    p2 = Player.new({value: 2, name: "Player 2"})
    board = GameBoard.new
    @game = Game.new([p1, p2], board)
  end

  def move
    # the current player makes their move
    @game.game_board.board = @game.game_board.place_in_random_col(@game.current_player.value)
    @game.switch_players
  end

  def play
    new
    # until @current_player.winner?
    until @game.game_board.full?
      move
      puts "Current player: #{@game.current_player.name}"
      puts @game.game_board.board.join(" ")
    end
    puts "game over"
  end
end
