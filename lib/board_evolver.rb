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
    row.each_with_index.map do |value, cell_index| 
      get_new_value_for_cell_at(row_index, cell_index)
    end
  end
  def get_new_value_for_cell_at x, y
    cell_alive = @current_board.is_cell_alive?(x, y)
    live_neighbors = @current_board.get_live_neighbor_count(x, y) 
    (should_cell_be_alive?(live_neighbors, cell_alive)) ? "X" : "."
  end
  def should_cell_be_alive? live_neighbors, currently_alive
    live_neighbors == 3 || (live_neighbors == 2 && currently_alive)
  end
end
