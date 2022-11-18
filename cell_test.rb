require_relative "cell"
require "test/unit"

class CellTest < Test::Unit::TestCase
  def test_cell_can_be_alive
    cell = Cell.new
    assert !cell.alive?
  end

  def test_will_be_alive_1_neighbor
    cell = Cell.new
    cell.living_neighbors = 1
    assert !cell.will_be_alive?
  end

  def test_will_be_alive_3_neighbor
    cell = Cell.new
    cell.living_neighbors = 3
    assert cell.will_be_alive?
  end

  def test_will_be_alive_more_than_3_neighbor
    cell = Cell.new
    cell.living_neighbors = 4
    assert !cell.will_be_alive?
  end
end
