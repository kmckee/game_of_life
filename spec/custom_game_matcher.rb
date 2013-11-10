require 'rspec/expectations'

RSpec::Matchers.define :match_game do |expected|
  match do |actual|
    expected.to_s == actual.to_s
  end
  failure_message_for_should do |actual|
    "\nThe game board is not correct.  \nExpected:\n" + expected.to_s + "Actual:\n" + actual.to_s + "\n"
  end
end
