class BoardEvolver
  def evolve initial_board
    @current_board = initial_board
    Board.new get_new_rows
  end
  
  private

  def get_new_rows 
    @current_board.each_with_index.map do |row, row_index|
      get_new_row_for(row_index)
    end
  end
  def get_new_row_for row_index
    @current_board[row_index].each_with_index.map do |value, cell_index| 
      get_new_value_for_cell_at(row_index, cell_index)
    end
  end
  def get_new_value_for_cell_at x, y
    cell_alive = @current_board.is_cell_alive?(x, y)
    live_neighbors = @current_board.get_live_neighbor_count(x, y) 
    should_cell_be_alive?(live_neighbors, cell_alive) ? "X" : "."
  end
  def should_cell_be_alive? live_neighbors, already_alive
    live_neighbors == 3 || (live_neighbors == 2 && already_alive)
  end
end
