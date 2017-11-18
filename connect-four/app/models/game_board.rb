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
 
  def place_in_random_col(value)
    rand = rand(0...board.size - 1)

    set_cell(rand, value)
  end

  def set_cell(y, value)
    x = get_next_opening(y)
    
    if x == -1 
      raise ArgumentError, 'Column is already full'
    end

    board[y][x] = value
  end

  def get_next_opening(y)
    col = get_column(y)
    # Starting at the end of the array, get the index of the first zero cell
    # If the column is full, it returns -1
    i = col.size - 1
    while i >= 0 do
      break if col[i] == 0
      i -= 1
    end
    i
  end

  def get_column(y)
    col = []
    i = 0
    # Ensure the column number is valid for the board
    if y < board.size
      # Iterate through each row, plucking the element from the given column
      while i < board.size  do
        col << board[i][y]
        i += 1
      end
    end
    col
  end

  def game_over
    return :winner if winner?
    return :draw if draw?
    false
  end
end
