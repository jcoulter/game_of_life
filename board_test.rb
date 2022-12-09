require_relative "board"
require "test/unit"

class BoardTest < Test::Unit::TestCase
    attr_reader :board

#   def setup
#     @board = Board.new(5,7)
#   end

  test 'board has dimensions' do
    expected_width = 5
    expected_height = 7
    @board = Board.new( expected_width, expected_height )
    
    assert_equal expected_width, board.width
    assert_equal expected_height, board.height

  end


  test 'board intializes cells' do
    @board = Board.new( 2, 2 )
    
    assert_equal Cell, @board.space(0,0).class
    assert_equal Cell, @board.space(0,1).class
    assert_equal Cell, @board.space(1,0).class
    assert_equal Cell, @board.space(1,1).class

  end

  test 'board boundaries' do
    @board = Board.new( 1, 1)
    assert_raise(Board::OutOfBoundsError) do
      @board.space(0, 1)
    end
    assert_raise(Board::OutOfBoundsError) do
      @board.space(1, 0)
    end
    assert_raise(Board::OutOfBoundsError) do
      @board.space(1, 1)
    end
  end

end