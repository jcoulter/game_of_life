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
  end

  def space(x, y)
    raise Board::OutOfBoundsError.new if out_of_bounds(x,y)

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

  def neighbors(x, y)
    results = []
    (x-1..x+1).each do |neighbor_x|
      (y-1..y+1).each do |neighbor_y|
        next if (neighbor_x == x  && neighbor_y == y) || out_of_bounds(neighbor_x, neighbor_y)

        results << space(neighbor_x, neighbor_y)
      end
    end
    results
  end

  private

  def out_of_bounds(x, y)
    x >= @width || y >= @height || x < 0 || y < 0
  end
end