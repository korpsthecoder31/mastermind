require 'rubocop'

require_relative 'player'

module Mastermind 
  class Human < Player
    def initialize
      super
      puts "Human player has been created"
    end

    def guess_colors
      i = 0
      guess_arr = []
      puts "Please select four colors:"
      while i < 4
        print "Color No. #{i + 1}: "
        guess_color = gets.chomp.upcase.strip
        if @color_choices.include?(guess_color)
          guess_arr << guess_color
          i += 1
        else
          puts "Invalid color. Try again."
        end
      end
      guess_arr
    end
  end
end