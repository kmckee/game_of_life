require 'spec_helper'
describe BoardEvolver do
  describe "#evolve" do
    it 'kills any live cell with no live neighbours.' do
      board = Board.new [['.', 'X', '.']]
      evolver = BoardEvolver.new
      new_board = evolver.evolve(board)
      new_board.is_cell_alive?(0,1).should be_false
    end
    it 'kills any live cell with one live neighbours.'
    it 'lets any live cell with two neighbors live.'
    it 'lets any live cell with three neighbors live.'
    it 'kills any live cell more than three live neighbours.'
    
    
    it 'leaves any dead cell with zero live neighbors dead.'
    it 'leaves any dead cell with one live neighbor dead.'
    it 'leaves any dead cell with two live neighbors dead.'
    it 'creates life in any cell with three live neighbours'
    it 'leaves any dead cell with more than three  live neighbors dead.'
  end
end
