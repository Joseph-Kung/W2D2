require_relative 'piece'
require_relative 'null_piece'
require_relative 'display'
require 'byebug'

class Board
    attr_accessor :grid
    
  def initialize(grid = Array.new(8) {Array.new(8)})
    @grid = grid
    starting_position
  end
  
  def move_piece(start_pos, end_pos)
    #byebug
    if self[start_pos].is_a?(NullPiece)
      raise StartPosError, 'There is no piece at that position!'
    elsif self[end_pos].class == Piece
      raise EndPosError, 'There is already a piece there!'
    else
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end
  end
  
  # private
  def [](pos)
    row, col = pos
    @grid[row][col]
  end
  
  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end
  
  def starting_position
    (0..1).each do |row|
      (0..7).each do |col|
        self[[row, col]] = Piece.new
      end
    end
    
    (6..7).each do |row|
      (0..7).each do |col|
        self[[row, col]] = Piece.new
      end
    end
    
    (2..5).each do |row|
      (0..7).each do |col|
        self[[row, col]] = NullPiece.new
      end
    end
    
    def valid_pos?(pos)
      pos.all? {|coor| coor.between?(0,7)}
    end
  end
end