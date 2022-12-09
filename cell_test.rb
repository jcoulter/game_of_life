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
    cell.neighbors = [Cell.new(true)]
    assert !cell.will_be_alive?
  end

  def test_will_be_alive_2_neighbors_currently_alive
    cell.neighbors = [Cell.new(true), Cell.new(true)]
    cell.alive = true
    assert cell.will_be_alive?
  end

  def test_will_be_alive_2_neighbors_currently_dead
    cell.neighbors = [Cell.new(true), Cell.new(true)]
    cell.alive = false
    assert !cell.will_be_alive?
  end

  def test_will_be_alive_3_neighbor
    cell.neighbors = [Cell.new(true), Cell.new(true), Cell.new(true)]
    assert cell.will_be_alive?
  end

  def test_will_be_alive_more_than_3_neighbor
    cell.neighbors = [Cell.new(true), Cell.new(true), Cell.new(true), Cell.new(true)]
    assert !cell.will_be_alive?
  end

  def test_cell_initializes_neighbors
    assert_equal [], cell.neighbors
  end

  def test_living_neighbors
    assert_equal 0, cell.living_neighbors
  end
   
  def test_living_neighbors_2 
    cell.neighbors = [Cell.new(true), Cell.new(false), Cell.new(true)]
    assert_equal 2, cell.living_neighbors
  end

  test 'show' do
    assert_equal '[ ]', cell.show
    cell.alive = true
    assert_equal '[A]', cell.show
  end

end
