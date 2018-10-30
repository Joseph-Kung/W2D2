require_relative "sliding_piece_module"
require_relative 'piece'

class Bishop < Piece
  include SlidingPiece
  
  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = :B
  end
end