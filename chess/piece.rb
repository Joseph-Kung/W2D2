require_relative 'board'
require 'byebug'

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
  
  def move_into_check?(end_pos)
    test_board = self.board.dup
    test_board.move_piece(self.pos, end_pos)
    test_board.in_check?(self.color)
  end
  
  def dup
    self.class.new(self.color, self.pos, self.board)
  end
  
  def inspect
    puts "##{self.object_id}, #{self.symbol}, #{self.color}, #{self.pos}"
  end
end