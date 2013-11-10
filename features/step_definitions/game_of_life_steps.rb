Given(/^the following game board:$/) do |board_table|
  board = Board.new (board_table.raw)
  @game = GameOfLife.new board
end

When(/^a generation passes$/) do
  @game.update 
end

Then(/^the board should look like:$/) do |board_table|
  @game.board.should match_game Board.new(board_table.raw)
end


