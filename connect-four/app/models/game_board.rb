class GameBoard < ApplicationRecord
  attr_reader :board

  def initialize(input = {})
    @board = input.fetch(:board, default)
  end

  def default
    Array.new(6) { Array.new(7) { Cell.new } }
  end

  def get_cell(x, y)
    board[y][x]
  end
  
  def set_cell(x, y, value)
    board[x][y] = value
  end

  def game_over
    return :winner if winner?
    return :draw if draw?
    false
  end
end
