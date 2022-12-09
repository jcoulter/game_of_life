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
      @positions[col] = []
      height.times do |row|
        @positions[col][row] = Cell.new
      end
    end
    p " @positions[x][y] = #{ @positions}"

  end

  def space(x, y)
    raise Board::OutOfBoundsError.new if x >= @width || y >= @height

    @positions[x][y]
  end

  def vivify(x, y)
    cell = space(x, y)
    cell.alive = true
  end

  def show
    result = ''
    @height.times do |row|
      @width.times do |col|
        result += space(col, row).show
      end
      result += "\n"
    end
    result
  end
end