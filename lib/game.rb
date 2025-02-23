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
      attempts = 0
      while attempts < 12
        @guesses = @guesser.guess_colors
        compare(@choices, @guesses)
        attempts += 1
      end
    end

    def compare(choices, guesses)
        choices_copy = choices.dup
        guesses_copy = guesses.dup
        black_pegs = 0
        white_pegs = 0
  
      guesses_copy.each_with_index { |color, index|
        if (color == choices_copy[index])
          black_pegs += 1
          choices_copy[index] = nil
          guesses_copy[index] = nil
        end
      }

      guesses_copy.compact.each { |color|
        if choices_copy.include?(color)
          white_pegs += 1
          index = choices_copy.index(color)
          choices_copy[index] = nil
        end
      }
      puts "Black Pegs: #{black_pegs} White Pegs: #{white_pegs}"
    end
  end
end