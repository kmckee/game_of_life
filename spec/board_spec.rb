require 'spec_helper'

describe Board do
  describe "#get_neighbor_values_for" do
    context "single row" do
      it "returns values to left or right of the specified cell" do
        board = Board.new [["1", "X", "2"]]
        board.get_neighbor_values_for(0, 1).should == ["1", "2"]
      end
      it "works with values that don't have values to the left" do
        board = Board.new [["X", "1"]]
        board.get_neighbor_values_for(0, 0).should == ["1"]
      end
      it "works with values that don't have values to the right" do
        board = Board.new [["1", "X"]]
        board.get_neighbor_values_for(0, 1).should == ["1"]
      end
    end
    context 'multiple rows' do
      it "returns values in the row above the specified cell" do
        board = Board.new [["1", "2", "3"], 
                           [".", "X", "."]]
        board.get_neighbor_values_for(1,1).should include("1", "2", "3")
      end
      it "returns values in the row below the specified cell" do
        board = Board.new [["1", "2", "3"], 
                           [".", "X", "."],
                           ["4", "5", "6"]]
        board.get_neighbor_values_for(1,1).should include("4", "5", "6")
      end
      it "does not include values from wrapping around the grid" do
        board = Board.new [["1", "2", "3"],
                           ["4", "5", "6"],
                           ["7", "8", "9"]]
        board.get_neighbor_values_for(0, 0).should =~ ["2", "4", "5"]
      end
    end
  end
  describe "#is_cell_alive?" do
    it 'returns true if the cell has an X' do
      board = Board.new [["X"]]
      board.is_cell_alive?(0,0).should be_true
    end
    it 'returns false if the cell does not have an X' do
      board = Board.new [["."]]
      board.is_cell_alive?(0,0).should be_false
    end
  end
  describe "#to_s" do
    it "converts a single row correctly" do
      board = Board.new [[".", ".", "."]]
      board.to_s.should == "| . | . | . |\n"
    end
    it "converts each row to a newline" do
      board = Board.new [[".", ".", "."],
                         [".", ".", "."]]
      board.to_s.should == "| . | . | . |\n| . | . | . |\n"
    end
  end
  describe "#get_live_neighbor_count" do
    it "counts all adjacent cells with an X in them" do
      full_board = Board.new [["X", ".", "X"]]
      count = full_board.get_live_neighbor_count(0, 1)
      count.should == 2
    end
    it "counts only adjacent cells with an X in them" do
      full_board = Board.new [[".", ".", "X"]]
      count = full_board.get_live_neighbor_count(0, 1)
      count.should == 1
    end
  end
end
