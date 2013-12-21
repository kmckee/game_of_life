class GameOfLife
  def initialize starting_board
    @evolver = BoardEvolver.new
    @current_board = starting_board 
  end
  def update
    @current_board = @evolver.evolve @current_board
  end
  def is_cell_alive? x, y
    @current_board.is_cell_alive? x,y
  end
  def board
    @current_board.to_s 
  end
end
