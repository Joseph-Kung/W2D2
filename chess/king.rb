require_relative "stepping_piece_module"
require_relative 'piece'

class King < Piece
  include SteppingPiece
  
  attr_reader :symbol
  
  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = :K
  end
end