
class Player

  VERSION = "Ovik"
  attr_reader :state

  def bet_request(game_state)
    @state = game_state

    case state['round']
    when 0
      state['current_buy_in']
    else
      me['stack']
    end
  end

  def showdown(game_state)

  end

  private

  def me
    my_id = state['in_action']
    state['players'].find { |player| player['id'] == my_id }
  end
end
