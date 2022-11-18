require_relative "cell"
require "test/unit"

class CellTest < Test::Unit::TestCase
  def test_cell_can_be_alive
    cell = Cell.new
    assert !cell.alive?
  end


end
