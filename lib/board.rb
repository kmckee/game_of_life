require 'forwardable'

class Board
  extend Forwardable
  def_delegator :@board, :each_with_index
  def initialize board
    @board = board
  end
  def get_neighbor_values_for row_index, column_index
    neighbors = []
    selected_row = @board[row_index]
    last_column = selected_row.length - 1
    left_column = column_index - 1
    right_column = column_index + 1
    neighbors << selected_row[left_column] if left_column >= 0
    neighbors << selected_row[right_column] if  right_column <= last_column 

    previous_row = @board[row_index -1] if row_index > 0

    if previous_row != nil
      neighbors << previous_row[left_column] 
      neighbors << previous_row[column_index]
      neighbors << previous_row[right_column]
    end

    next_row = @board[row_index + 1]
    
    if next_row != nil
      neighbors << next_row[left_column] if left_column >= 0
      neighbors << next_row[column_index]
      neighbors << next_row[right_column]
    end
    neighbors
  end
  def get_live_neighbor_count row_index, column_index
    get_neighbor_values_for(row_index, column_index).count { |value| value == "X" } 
  end
  def is_cell_alive? x,y
    @board[x][y] == 'X'
  end
  def to_s
    string = ""
    @board.each do |row|
      string += row.to_row_string
    end
    string
  end
end

class Array
  def to_row_string
    "| " + self.join(" | ") + " |\n"
  end
end
