class GameController < ApplicationController
  def create
    p1 = Player.new({value: 1, name: "Player 1"})
    p2 = Player.new({value: 2, name: "Player 2"})
    @game = Game.create([p1, p2])

    binding.pry
    if @game.persisted
      render @game
    else
      render :new
    end
  end

  def move
    # the current player makes their move
    @game.game_board.place_in_random_col(@current_player.value)
    # check if game is won
    # swap players turns
    game.swap_players
  end

  def play
   # until @current_player.winner?
      move
    #end
  end
end
