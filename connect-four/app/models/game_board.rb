class GameBoard < ApplicationRecord
  attr_reader :board

  def initialize(input = {})
    super
    @board = input.fetch(:board, test)
  end

  def default
    Array.new(6) { Array.new(7) { 0 } }
  end

  def test
    Array.new(6) { Array.new(7) { 0 } } << [1,1,1,2,1,2,2]
  end

  def get_cell(x, y)
    board[x][y]
  end
 
  def place_in_random_col(value)
    rand = rand(0...board.size - 1)

    set_cell(rand, value)
  end

  def set_cell(y, value)
    x = get_next_opening(y)
    
    if x == -1 
      begin
        raise ArgumentError, 'Column is already full'
      rescue
        place_in_random_col(value)
      end
    end

    board[x][y] = value
    board
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

  def full?
    board.each do |row|
      row.each do |cell|
        if cell == 0
          return false
          break
        end
      end
    end
    return true
  end

  def game_over
    return :winner if winner?
    return :draw if draw?
    false
  end
end
