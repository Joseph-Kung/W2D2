require_relative "sliding_piece_module"
require_relative 'piece'

class Rook < Piece
  attr_reader :symbol
  
  include SlidingPiece
  
  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = :R
  end
end