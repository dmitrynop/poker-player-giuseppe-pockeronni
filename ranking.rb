require "poker_ranking"
require "json"

class Ranking
  # input :
  # e.g : [{:rank=>"5", :suit=>"diamonds"}, {:rank=>"6", :suit=>"diamonds"}, {:rank=>"7", :suit=>"diamonds"}, {:rank=>"7", :suit=>"spades"}, {:rank=>"8", :suit=>"diamonds"}, {:rank=>"9", :suit=>"diamonds"}]
  # cards=[
  #  {"rank":"5","suit":"diamonds"},
  #  {"rank":"6","suit":"diamonds"},
  #  {"rank":"7","suit":"diamonds"},
  #  {"rank":"7","suit":"spades"},
  #  {"rank":"8","suit":"diamonds"},
  #  {"rank":"9","suit":"diamonds"}
  # ]

  # returns :
  # {
  #   :rank=>8,
  #   :value=>9,
  #   :second_value=>9,
  #   :kickers=>[],
  #   :cards_used => [],
  #   :cards => []
  # }
  def self.check_hand(cards)
    if cards.length >= 5
      data = PokerRanking::Hand.new(cards).data
      data
    else
      raise "not enough cards"
    end
  end
end
