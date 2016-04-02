require_relative 'ranking'

class SecondHand
  def initialize(own_cards, community_cards)
    @own_cards = own_cards
    @community_cards = community_cards
    @cards = @own_cards + @community_cards
  end

  def good?
    # check all cards
    response = Ranking.check_hand(@cards)
    p response
    if response.rank > 4
      true
    else
      false
    end

  end
end
