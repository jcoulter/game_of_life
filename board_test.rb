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

end