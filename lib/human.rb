require 'rubocop'

require_relative 'player'

module Mastermind 
  class Human < Player
    def initialize
      super
      puts "Human player has been created"
    end
  end
end