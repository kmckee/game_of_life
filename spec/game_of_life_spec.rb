require 'spec_helper'

describe GameOfLife do
  describe '#is_cell_alive?' do
    it 'is true when the board say its alive' do
      board = double('board')
      board.stub(:is_cell_alive?) { true }
      game = GameOfLife.new board
      game.is_cell_alive?(0,0).should be_true
    end
    it 'is false when the board says its dead' do
      board = double('board')
      board.stub(:is_cell_alive?) { false }
      game = GameOfLife.new board
      game.is_cell_alive?(0,0).should be_false
    end
  end
end
