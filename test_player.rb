$: << File.dirname(__FILE__)

require 'json'
require 'player'

game_state = JSON.parse(File.read('./fixtures/default_game_state.json'))
p Player.new.bet_request(game_state).to_s
