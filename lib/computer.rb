require 'rubocop'

require_relative 'player'

module Mastermind 
  class Computer < Player
    def initialize
      super
      puts "Computer player has been created"
    end

    def pick_colors(choices_arr, color_arr)
      i = 0
      while i < 4 do
        choices_arr << color_arr.sample
        i += 1
      end
      choices_arr
    end
  end
end