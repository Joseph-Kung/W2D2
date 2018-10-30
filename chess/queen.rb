require_relative "sliding_piece_module"
require_relative 'piece'

class Queen < Piece
  include SlidingPiece
  
  attr_reader :symbol
  
  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = :Q
  end
end