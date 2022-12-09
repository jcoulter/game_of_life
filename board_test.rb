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
  end

  test 'show prints the board' do
    board = Board.new( 2, 2)
    assert_equal "[ ][ ]\n[ ][ ]\n", board.show
    board.vivify(0,0)
    assert_equal "[A][ ]\n[ ][ ]\n", board.show
  end

end