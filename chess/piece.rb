require_relative 'board'


class Piece
  attr_reader :color, :pos, :board
  
  def initialize(color, pos, board)
    @color = color 
    @pos = pos
    @board = board
  end
  
  def moves(pos)
    
  end
end


module SteppingPiece
  
end