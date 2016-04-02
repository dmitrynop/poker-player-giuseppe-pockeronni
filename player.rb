require_relative 'first_hand'
require_relative 'second_hand'

class Player
  VERSION = "Brickleberry"

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
        minimum_bet
      else
        suitable_bet = (game_state['current_buy_in'] == (game_state['small_blind'] * 2))
        has_out = game_state['players'].select { |p| p['status'] == 'out' }.any?
        if suitable_bet && has_out
          minimum_bet
        else
          0
        end
      end
    end
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
