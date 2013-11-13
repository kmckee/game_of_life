require 'forwardable'


class Board
  extend Forwardable
  def_delegator :@board, :each_with_index
  def initialize board
    @board = board
  end
  def to_s
    string = ""
    @board.each do |row|
      string += row_to_s row
    end
    string
  end
  def get_neighbor_values_for row_index, column_index
    neighbors = []
    row = @board[row_index]
    left_column = column_index - 1
    right_column = column_index + 1
    neighbors << row[left_column] if left_column >= 0
    neighbors << row[right_column]
    neighbors
  end
    
  private 

  def row_to_s row 
    "| " + row.join(" | ") + " |\n"
  end
end
