require 'forwardable'

class Board
  extend Forwardable
  def_delegators :@rows, :each_with_index, :[], :length
  def initialize board
    @rows = board
  end
  def get_neighbor_values_for row_index, column_index
    previous_row = @rows[row_index - 1] if row_index > 0
    selected_row = @rows[row_index]
    next_row = @rows[row_index + 1]
    
    left_column = column_index - 1
    right_column = column_index + 1
   
    neighbors = []
    neighbors << get_values_from_row(selected_row, left_column, right_column)
    neighbors << get_values_from_row(previous_row, left_column, column_index, right_column)
    neighbors << get_values_from_row(next_row, left_column, column_index, right_column)
    neighbors.flatten!
  end
  def get_live_neighbor_count row_index, column_index
    get_neighbor_values_for(row_index, column_index).count { |value| value == "X" } 
  end
  def is_cell_alive? x,y
    @rows[x][y] == 'X'
  end
  def to_s
    string = ""
    @rows.each do |row|
      string += row.to_row_string
    end
    string
  end

  private 

  def get_values_from_row row, *column_indexes
    values = []
    if row != nil
      column_indexes.each do |index|
        values << row[index] if index >= 0 && index < row.count
      end
    end
    values
  end
end

class Array
  def to_row_string
    "| " + self.join(" | ") + " |\n"
  end
end
