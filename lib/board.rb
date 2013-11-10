class Board
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
    
  private 

  def row_to_s row 
    "| " + row.join(" | ") + " |\n"
  end
end
