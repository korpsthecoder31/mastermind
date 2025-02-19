require 'rubocop'

require_relative 'player'

module Mastermind 
  class Computer < Player
    def initialize
      super
      puts "Computer player has been created"
    end
  end
end