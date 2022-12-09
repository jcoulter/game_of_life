require_relative "cell"

class Board
  attr_accessor :width, :height, :positions

  class Board::OutOfBoundsError < StandardError
  end

  def initialize(width, height)
    @width = width
    @height = height
    @positions = [[]]
  
    width.times do |col|
      positions[col] = []
      height.times do |row|
        @positions[col][row] = Cell.new
      end
    end
    # set up the board
  end

  def space(x, y)
    @positions[x][y]
  end
end