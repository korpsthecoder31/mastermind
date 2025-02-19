require 'rubocop'

require_relative 'player'

module Mastermind 
  class Computer < Player
    def initialize
      super
      puts "Computer player has been created"
    end

    def pick_colors
      i = 0
      choice_arr = []
      while i < 4 do
        choice_arr << @color_choices.sample
        i += 1
      end
      choice_arr
    end
  end
end