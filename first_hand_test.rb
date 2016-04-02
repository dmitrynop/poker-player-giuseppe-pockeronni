$: << File.dirname(__FILE__)

require 'json'
require 'first_hand'


p FirstHand.new([{"rank"=>"A", "suit"=>"spades"}, {"rank"=>"A", "suit"=>"hearts"}]).good?
p FirstHand.new([{"rank"=>"K", "suit"=>"spades"}, {"rank"=>"K", "suit"=>"hearts"}]).good?
p FirstHand.new([{"rank"=>"Q", "suit"=>"spades"}, {"rank"=>"Q", "suit"=>"hearts"}]).good?
p FirstHand.new([{"rank"=>"A", "suit"=>"hearts"}, {"rank"=>"K", "suit"=>"hearts"}]).good?
p FirstHand.new([{"rank"=>"A", "suit"=>"spades"}, {"rank"=>"Q", "suit"=>"spades"}]).good?
p FirstHand.new([{"rank"=>"J", "suit"=>"spades"}, {"rank"=>"J", "suit"=>"hearts"}]).good?
p FirstHand.new([{"rank"=>"K", "suit"=>"hearts"}, {"rank"=>"Q", "suit"=>"hearts"}]).good?
p FirstHand.new([{"rank"=>"A", "suit"=>"hearts"}, {"rank"=>"J", "suit"=>"hearts"}]).good?
p FirstHand.new([{"rank"=>"A", "suit"=>"hearts"}, {"rank"=>"K", "suit"=>"spades"}]).good?
p FirstHand.new([{"rank"=>"10", "suit"=>"hearts"}, {"rank"=>"10", "suit"=>"spades"}]).good?
