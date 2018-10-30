require_relative "stepping_piece_module"
require_relative 'piece'

class Knight < Piece
  include SteppingPiece
  
  attr_reader :symbol
  
  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = :k
  end
end