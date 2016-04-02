$: << File.dirname(__FILE__)

require 'json'
require 'second_hand'


p SecondHand.new([
  {"rank"=>"A", "suit"=>"spades"}, {"rank"=>"A", "suit"=>"hearts"}],
  [{"rank"=>"Q", "suit"=>"spades"}, {"rank"=>"Q", "suit"=>"hearts"}, {"rank"=>"7", "suit"=>"hearts"}
]).good?
