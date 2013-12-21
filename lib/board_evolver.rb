class BoardEvolver
  def evolve initial_board
    @current_board = initial_board
    new_board = []
    initial_board.each_with_index do |row,row_index|
      new_board << get_new_row_for(row, row_index)
    end
    Board.new new_board
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
