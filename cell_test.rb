require_relative "cell"
require "test/unit"

class CellTest < Test::Unit::TestCase
  attr_reader :cell

  def setup
    @cell = Cell.new
  end

  def test_cell_can_be_alive
    assert !cell.alive?
  end

  def test_will_be_alive_1_neighbor
    cell.living_neighbors = 1
    assert !cell.will_be_alive?
  end

  def test_will_be_alive_2_neighbors_currently_alive
    cell.living_neighbors = 2
    cell.alive = true
    assert cell.will_be_alive?
  end

  def test_will_be_alive_2_neighbors_currently_dead
    cell.living_neighbors = 2
    cell.alive = false
    assert !cell.will_be_alive?
  end

  def test_will_be_alive_3_neighbor
    cell.living_neighbors = 3
    assert cell.will_be_alive?
  end

  def test_will_be_alive_more_than_3_neighbor
    cell.living_neighbors = 4
    assert !cell.will_be_alive?
  end
end
