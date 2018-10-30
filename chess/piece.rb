require_relative 'board'

class Piece
  attr_reader :color, :pos, :board, :symbol
  
  def initialize(color, pos, board)
    @color = color 
    @pos = pos
    @board = board
    @symbol = :p
  end
  
  def moves(pos)
    
  end
end