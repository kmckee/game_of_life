class GameOfLife
  def initialize starting_board
    @current_board = starting_board 
  end
  def update
    new_board = []
    @current_board.each_with_index do |row,row_index|
      new_board << get_new_row_for(row, row_index)
    end
    @current_board = Board.new new_board
  end
  def is_cell_alive? x, y
    @current_board.is_cell_alive? x,y
  end
  def board
    @current_board.to_s 
  end

  private

  def get_new_row_for row, row_index
    new_row = []
    row.each_with_index do |value, cell_index|
      new_row << get_new_value_for_cell_at(row_index, cell_index)
    end
    new_row
  end
  def get_new_value_for_cell_at x, y
    live_neighbors = @current_board.get_live_neighbor_count(x, y) 
    (live_neighbors == 3 || live_neighbors == 2) ? "X" : "."
  end
end
