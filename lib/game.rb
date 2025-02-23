require 'rubocop'

require_relative 'player'
require_relative 'human'
require_relative 'computer'

module Mastermind
  class Game
    attr_accessor :black_pegs, :white_pegs, :winner

    def initialize
      @choices = []
      @guesses = []
      @guesser = Human.new
      @chooser = Computer.new
      @black_pegs = 0
      @white_pegs = 0
      @winner = false
      play_game
    end

    def play_game
      @choices = @chooser.pick_colors 
      attempts = 0
      while attempts < 12
        @guesses = @guesser.guess_colors
        compare(@choices, @guesses)
        attempts += 1
        break if @winner == true
      end
      game_over
    end

    def compare(choices, guesses)
        choices_copy = choices.dup
        guesses_copy = guesses.dup
        @black_pegs = 0
        @white_pegs = 0
  
      guesses_copy.each_with_index { |color, index|
        if (color == choices_copy[index])
          @black_pegs += 1
          choices_copy[index] = nil
          guesses_copy[index] = nil
        end
      }

      guesses_copy.compact.each { |color|
        if choices_copy.include?(color)
          @white_pegs += 1
          index = choices_copy.index(color)
          choices_copy[index] = nil
        end
      }
      puts "Black Pegs: #{@black_pegs} White Pegs: #{@white_pegs}"

      if @black_pegs == 4 
        @winner = true
      end
    end

    def game_over
      if @winner == true
        puts "CONGRATS"
      else
        puts "YOU LOSE"
      end
    end
  end
end