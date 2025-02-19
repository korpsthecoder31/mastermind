require 'rubocop'

require_relative 'player'
require_relative 'human'
require_relative 'computer'

module Mastermind
  class Game
    def initialize
      @choices = []
      @guesses = []
      @guesser = Human.new
      @chooser = Computer.new
      play_game
    end

    def play_game
      @choices = @chooser.pick_colors
      @guesses = @guesser.guess_colors
      p @choices
      p @guesses
    end
  end
end