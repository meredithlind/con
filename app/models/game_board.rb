class GameBoard < ApplicationRecord
  attr_reader :board

  def initialize(input = {})
    super
    @board = input.fetch(:board, default)
  end

  def default
    Array.new(6) { Array.new(7) { 0 } }
  end

  def sample
    Array.new(5) { Array.new(7) { 0 } } << [1,1,1,2,1,2,2]
  end

  def get_cell(x, y)
    board[x][y]
  end
 
  def place_in_random_col(value)
    rand = rand(0...board[0].size)

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
    if y < board[0].size
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

  def vertical_victory
    row = 0
    until row == 2 do
      col = 0
      until col == 6 do
        if board[row][col] != 0 &&
          board[row][col] == board[row+1][col] &&
          board[row][col] == board[row+2][col] &&
          board[row][col] == board[row+3][col]
          return board[row][col]
        end
        col += 1
      end
      row += 1
    end
    return 0
  end

  def horizontal_victory
    row = 0
    until row == 5 do
      col = 0
      until col == 3 do
        if board[row][col] != 0 &&
          board[row][col] == board[row][col+1] &&
          board[row][col] == board[row][col+2] &&
          board[row][col] == board[row][col+3]
          return board[row][col]
        end
        col += 1
      end
      row += 1
    end
    return 0
  end

  def diagonal_victory
    col = 0
    until col == 3 do
      # Check for descending horizontal
      row = 0
      until row == 2 do
        if board[row][col] != 0 &&
          board[row][col] == board[row+1][col+1] &&
          board[row][col] == board[row+2][col+2] &&
          board[row][col] == board[row+3][col+3]
          return board[row][col]
        end
        row += 1
      end

      # Check for ascending horizontal
      row = 3
      until row == 5 do
        if board[row][col] != 0 &&
          board[row][col] == board[row-1][col+1] &&
          board[row][col] == board[row-2][col+2] &&
          board[row][col] == board[row-3][col+3]
          return board[row][col]
        end
        row += 1
      end
      col += 1
    end
    return 0
  end

  def win?(player)
    if player == 'player-one'
      player = 1
    else
      player = 2
    end

    horizontal_victory == player || vertical_victory == player || diagonal_victory == player
  end

  def get_next_smart_move
    i = 0
    while i < board[0].size do
      j = get_next_opening(i) + 1
      if j < board.size && board[j][i] == 1
        return i
      end
      i += 1
    end
    rand(0...@board[0].size)
  end
end
