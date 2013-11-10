require 'spec_helper'

describe Board do
  describe "#inspect" do
    it "converts a single row correctly" do
      board = Board.new [[" ", " ", " "]]
      board.to_s.should == "|   |   |   |\n"
    end
    it "converts each row to a newline" do
      board = Board.new [[" ", " ", " "],
                         [" ", " ", " "]]
      board.to_s.should == "|   |   |   |\n|   |   |   |\n"
    end
  end
end
