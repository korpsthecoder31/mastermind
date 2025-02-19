require 'rubocop'

module Mastermind
  class Player
    def initialize
      @color_choices = ["RED", "BLUE", "YELLOW", "GREEN", "BLACK", "WHITE"]
    end
  end
end