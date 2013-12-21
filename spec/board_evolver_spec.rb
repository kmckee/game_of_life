require 'spec_helper'
describe BoardEvolver do
  describe "#evolve" do
    let(:evolver) { BoardEvolver.new }
    context 'living cell' do
      it 'kills any live cell with no live neighbours.' do
        board = Board.new [['.', 'X', '.']]
        new_board = evolver.evolve(board)
        new_board.is_cell_alive?(0,1).should be_false
      end
      it 'kills any live cell with one live neighbours.' do
        board = Board.new [['X', 'X', '.']]
        new_board = evolver.evolve(board)
        new_board.is_cell_alive?(0,1).should be_false
      end
      it 'lets any live cell with two neighbors live.' do
        board = Board.new [['X', 'X', 'X']]
        new_board = evolver.evolve(board)
        new_board.is_cell_alive?(0,1).should be_true
      end
      it 'lets any live cell with three neighbors live.' do
        board = Board.new [['X', 'X', 'X'],
                           ['.', 'X', '.']]
        new_board = evolver.evolve(board)
        new_board.is_cell_alive?(0,1).should be_true
      end
      it 'kills any live cell more than three live neighbours.' do
        board = Board.new [['X', 'X', 'X'],
                           ['.', 'X', 'X']]
        new_board = evolver.evolve(board)
        new_board.is_cell_alive?(0,1).should be_false
      end
    end
    context 'dead cell' do 
      it 'leaves any dead cell with zero live neighbors dead.' do
        board = Board.new [['.', '.', '.']]
        new_board = evolver.evolve(board)
        new_board.is_cell_alive?(0,1).should be_false
      end
      it 'leaves any dead cell with one live neighbor dead.' do
        board = Board.new [['X', '.', '.']]
        new_board = evolver.evolve(board)
        new_board.is_cell_alive?(0,1).should be_false
      end
      it 'leaves any dead cell with two live neighbors dead.' do
        board = Board.new [['X', '.', 'X']]
        new_board = evolver.evolve(board)
        new_board.is_cell_alive?(0,1).should be_false
      end
      it 'creates life in any cell with three live neighbours' do
        board = Board.new [['X', '.', 'X'],
                           ['.', 'X', '.']]
        new_board = evolver.evolve(board)
        new_board.is_cell_alive?(0,1).should be_true
      end
      it 'leaves any dead cell with more than three  live neighbors dead.' do
        board = Board.new [['X', '.', 'X'],
                           ['X', 'X', '.']]
        new_board = evolver.evolve(board)
        new_board.is_cell_alive?(0,1).should be_false
      end
    end
  end
end
