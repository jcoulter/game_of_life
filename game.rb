require_relative "board"

class Game
  attr_accessor :board

  def initialize(width, height)
    @board = Board.new(width, height)
    print board.show
  end

  def vivify(x, y)
    @board.vivify(x,y)
    print board.show
  end

  def run
    # Set State
    while(true) do
      sleep 1
      puts ""
      print board.show
      board.step
    end
  end
end