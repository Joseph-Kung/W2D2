require_relative 'board'

class Piece
  attr_reader :color, :board, :symbol
  attr_accessor :pos
  
  def initialize(color, pos, board)
    @color = color 
    @pos = pos
    @board = board
    @symbol = :p
  end
  
  def moves(pos)
    
  end
  
  def inspect
    puts "#{self.symbol}, #{self.color}, #{self.pos}"
  end
end