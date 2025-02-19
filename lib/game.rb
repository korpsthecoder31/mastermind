require 'rubocop'

require_relative 'player'
require_relative 'human'
require_relative 'computer'

module Mastermind
  class Game
    def initialize
      @color_choices = ["red", "blue", "yellow", "green", "black", "white"]
      @choices = []
      @guesser = Human.new
      @chooser = Computer.new
      play_game
    end

    def play_game
      @choices = @chooser.pick_colors(@choices, @color_choices)
      p @choices
    end
  end
end