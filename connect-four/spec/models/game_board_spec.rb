require 'rails_helper'

RSpec.describe GameBoard, type: :model do

  context "#initialize" do
    it "creates a game board from a board" do
      expect { GameBoard.new(board: "board") }.to_not raise_error
    end

    it "creates a board that is 6x7" do
      board = GameBoard.new
      expect(board.board.size).to eq(6)

      board.board.each do |row|
        expect(row.size).to eq(7)
      end
    end

    context "#get_cell" do
      it "returns the cell from the (x, y) coordinate" do
        board = [[0, 0, 0], [1, 1, 0], [1, 1, 1]]
        gameboard = GameBoard.new(board: board)
        expect(gameboard.get_cell(2, 1)).to eq(0)
      end
    end

    context "#set_cell" do
      it "updates the value of a given cell" do
        board = [[0, 0, 0], [0, 1, 0], [0, 2, 0]]
        gameboard = GameBoard.new(board: board)
        gameboard.set_cell(2, 2)
        gameboard.set_cell(1, 1)
        expect(gameboard.get_cell(2, 2)).to eq(2)
        expect(gameboard.get_cell(0, 1)).to eq(1)
      end

      it "raises error when column is already full" do
        board = [[1, 0, 0], [2, 1, 0], [1, 2, 0]]
        gameboard = GameBoard.new(board: board)
        expect { gameboard.set_cell(0, 1) }.to raise_error(ArgumentError)
      end
    end

    context "#get_next_opening" do
      it "gets the index of the first cell of value 0" do
        board = [[0, 0, 0, 2], [0, 2, 0, 2], [1, 1, 0, 1], [1, 1, 0, 2]]
        gameboard = GameBoard.new(board: board)

        expect(gameboard.get_next_opening(0)).to eq(1)
        expect(gameboard.get_next_opening(1)).to eq(0)
        expect(gameboard.get_next_opening(2)).to eq(3)
        expect(gameboard.get_next_opening(3)).to eq(-1)
      end
    end

    context "#get_column" do
      it "gets the values in the given column" do
        board = [[0, 0, 0], [0, 2, 0], [1, 1, 0]]
        gameboard = GameBoard.new(board: board)

        expect(gameboard.get_column(0)).to eq([0, 0, 1])
        expect(gameboard.get_column(1)).to eq([0, 2, 1])
        expect(gameboard.get_column(2)).to eq([0, 0, 0])
      end
    end

    context "#board" do
      it "gets the board" do
        board = GameBoard.new(board: "something")
        expect(board.board).to eq "something"
      end
    end
    
   xcontext "#game_over" do
      it "returns :winner if winner? is true" do
        board = GameBoard.new
        board.stub(:winner?) { true }
        expect(board.game_over).to eq :winner
      end

      it "returns :draw if winner? is false and draw? is true" do
        board = GameBoard.new
        board.stub(:winner?) { false }
        board.stub(:draw?) { true }
        expect(board.game_over).to eq :draw
      end

      it "returns false if winner? is false and draw? is false" do
        board = GameBoard.new
        board.stub(:winner?) { false }
        board.stub(:draw?) { false }
        expect(board.game_over).to eq(false)
      end
    end
  end
end
