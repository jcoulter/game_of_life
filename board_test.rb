require_relative "board"
require "test/unit"

class BoardTest < Test::Unit::TestCase
    attr_reader :board

  test 'board has dimensions' do
    expected_width = 5
    expected_height = 7
    board = Board.new( expected_width, expected_height )
    
    assert_equal expected_width, board.width
    assert_equal expected_height, board.height

  end


  test 'board intializes cells' do
    board = Board.new( 2, 2 )
    
    assert_equal Cell, board.space(0,0).class
    assert_equal Cell, board.space(0,1).class
    assert_equal Cell, board.space(1,0).class
    assert_equal Cell, board.space(1,1).class

  end

  test 'seed configures cells' do
    board = Board.new( 2, 2 )
    
    assert !board.space(0,0).alive?
    assert !board.space(0,1).alive?

    board.vivify(0,1)
    
    assert !board.space(0,0).alive?
    assert board.space(0,1).alive?
  end

  test 'board boundaries' do
    board = Board.new( 1, 1)
    assert_raise(Board::OutOfBoundsError) do
      board.space(0, 1)
    end

    assert_raise(Board::OutOfBoundsError) do
      board.space(1, 0)
    end

    assert_raise(Board::OutOfBoundsError) do
      assert_nil board.space(1, 1)
    end

    assert_raise(Board::OutOfBoundsError) do
      assert_nil board.space(-1, 0)
    end

    assert_raise(Board::OutOfBoundsError) do
      assert_nil board.space(0, -1)
    end

    assert_raise(Board::OutOfBoundsError) do
      assert_nil board.space(-1, -1)
    end
  end

  test 'show prints the board' do
    board = Board.new( 2, 2)
    assert_equal "[ ][ ]\n[ ][ ]\n", board.show
    board.vivify(0,0)
    assert_equal "[A][ ]\n[ ][ ]\n", board.show
  end

  test 'neighbors' do

    board = Board.new( 3, 3 )
    cell_a = board.space(0,0)
    cell_b = board.space(0,1)
    cell_c = board.space(0,2)
    cell_d = board.space(1,0)
    cell_e = board.space(1,1)
    cell_f = board.space(1,2)
    cell_g = board.space(2,0)
    cell_h = board.space(2,1)
    cell_i = board.space(2,2)


    neighbors = board.neighbors(1,1)
    assert_equal 8, neighbors.count
    assert_equal [], [cell_a, cell_b, cell_c, cell_d, cell_f, cell_g, cell_h, cell_i] - neighbors

    neighbors = board.neighbors(0,0)
    assert_equal 3, neighbors.count
    assert_equal [], [cell_b, cell_d, cell_e] - neighbors

    neighbors = board.neighbors(2,2)
    assert_equal 3, neighbors.count
    assert_equal [], [cell_e, cell_f, cell_h] - neighbors

    neighbors = board.neighbors(1,2)
    assert_equal 5, neighbors.count
    assert_equal [], [cell_b, cell_c, cell_e, cell_h, cell_i] - neighbors
  end


end