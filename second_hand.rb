require_relative 'ranking'

class SecondHand
  def initialize(own_cards, community_cards)
    @own_cards = own_cards
    @community_cards = community_cards
    @cards = @own_cards + @community_cards
  end

  def decision
    # check all cards
    response = Ranking.check_hand(@cards)
    p response
    if response['rank'] > 4
      :raise
    elsif response['rank'] > 1
      :call
    else
      :pass
    end

  end
end
