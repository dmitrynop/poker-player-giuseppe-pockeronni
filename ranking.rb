require "poker_ranking"
require "json"

class Ranking
  # cards=[
  #  {"rank":"5","suit":"diamonds"},
  #  {"rank":"6","suit":"diamonds"},
  #  {"rank":"7","suit":"diamonds"},
  #  {"rank":"7","suit":"spades"},
  #  {"rank":"8","suit":"diamonds"},
  #  {"rank":"9","suit":"diamonds"}
  # ]

  def self.check_hand(cards)
    if cards.length >= 5
      JSON.generate PokerRanking::Hand.new(cards).data
    else
      halt 400, "Bad request: not enough cards"
    end
  end
end
