class GameOfLife
  def initialize starting_board
    @current_board = starting_board 
  end
  def update
    new_board = []
    @current_board.each_with_index do |row,row_index|
      new_row = []
      row.each_with_index do |value, cell_index|
        if (@current_board.get_live_neighbor_count(row_index, cell_index) == 3)
          new_row << "X"
        else
          new_row << "."
        end
      end
      new_board << new_row
    end
    @current_board = Board.new new_board
  end
  def is_cell_alive? x, y
    @current_board.is_cell_alive? x,y
  end
  def board
    @current_board.to_s 
  end
end
