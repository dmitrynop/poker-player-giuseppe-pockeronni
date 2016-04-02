
class Player
  VERSION = "Ovik"

  MINIMUM_BET = 240
  attr_reader :state

  def bet_request(game_state)
    @state = game_state

    case state['round']
    when 0
      state['current_buy_in']
    else
      smart_bet
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
