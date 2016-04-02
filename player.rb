require_relative 'first_hand'
require_relative 'second_hand'

class Player
  VERSION = "Breaking bad"

  MINIMUM_BET = 240
  attr_reader :state

  def bet_request(game_state)
    @state = game_state

    if (me['hole_cards'] + state['community_cards']).length >= 5
      case SecondHand.new(me['hole_cards'], state['community_cards']).decision
      when :call
        minimum_bet
      when :raise
        smart_bet
      else # pass
        0
      end
    else
      if FirstHand.new(me['hole_cards']).good?
        smart_bet
      else
        minimum_bet
      end
    end
    # case state['round']
    # when 0
    #   if FirstHand.new(me['hole_cards']).good?
    #     smart_bet
    #   else
    #     minimum_bet
    #   end
    # else
    #   if SecondHand.new(me['hole_cards'], state['community_cards']).good?
    #     smart_bet
    #   else
    #     minimum_bet
    #   end
    # end
  end

  def showdown(game_state)

  end

  private

  def me
    return @me if @me

    my_id = state['in_action']
    @me = state['players'].find { |player| player['id'] == my_id }
  end

  def smart_bet
    [minimum_bet, me['stack'] / 2].max
  end

  def minimum_bet
    @minimum_bet ||= state['current_buy_in'] - me['bet'] + MINIMUM_BET
  end
end
