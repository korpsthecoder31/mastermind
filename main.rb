require 'rubocop'
require_relative 'lib/intro'
require_relative 'lib/game'

include Mastermind

intro_message
game = Game.new