require 'spec_helper'

describe Board do
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
  describe "#get_neighbor_values_for" do
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
end
