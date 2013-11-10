class GameOfLife
  def initialize starting_board
    @board = starting_board 
  end
  def update
    @board = Board.new [[".", ".", "."],
                        [".", "X", "."],
                        [".", ".", "."]]
  end
  def board
    @board.to_s 
  end
end
