require_relative 'piece'
require_relative 'null_piece'
require_relative 'display'
require_relative 'bishop'
require_relative 'king'
require_relative 'knight'
require_relative 'queen'
require_relative 'rook'
require_relative 'cursor'

require 'byebug'

class Board
    attr_accessor :grid
    
  def initialize(grid = Array.new(8) {Array.new(8)})
    @grid = grid
    starting_position
  end
  
  def move_piece(start_pos, end_pos)
    if self[start_pos].is_a?(NullPiece)
      raise StartPosError, 'There is no piece at that position!'
    elsif self[end_pos].class == Piece
      raise EndPosError, 'There is already a piece there!'
    else
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
      self[end_pos].pos = end_pos
    end
  end
  
  def in_check?(color)
    king = grid.flatten.select {|piece| piece.class == King && piece.color == color}.first
    king_color = king.color
    king_pos = king.pos
    
    enemies = grid.flatten.select {|piece| piece.color != king_color && piece.class != NullPiece && piece.class != Piece}
    enemies.each do |enemy|
      return true if enemy.move_dirs.include?(king_pos)
    end
    false
  end
  
  def checkmate?(color)
  end
  
  def dup
    result = Board.new
    (0..7).each do |row|
      (0..7).each do |col|
        if self[[row, col]].class != NullPiece
          result[[row, col]] = self[[row, col]].dup
        else
          result[[row, col]] = NullPiece.instance
        end 
      end
    end
    
    result
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
    
    #spawn non-pawn black pieces
    (0..7).each do |col|
      if col == 0 || col == 7
        self[[0, col]] = Rook.new(:black, [0,col], self)
      elsif col == 1 || col == 6
        self[[0, col]] = Knight.new(:black, [0,col], self)
      elsif col == 2 || col == 5
        self[[0, col]] = Bishop.new(:black, [0,col], self)
      elsif col == 3
        self[[0, col]] = Queen.new(:black, [0,col], self)
      else
        self[[0, col]] = King.new(:black, [0,col], self)
      end
    end
    
    #spawn non-pawn white pieces
    (0..7).each do |col|
      if col == 0 || col == 7
        self[[7, col]] = Rook.new(:white, [7,col], self)
      elsif col == 1 || col == 6
        self[[7, col]] = Knight.new(:white, [7,col], self)
      elsif col == 2 || col == 5
        self[[7, col]] = Bishop.new(:white, [7,col], self)
      elsif col == 3
        self[[7, col]] = Queen.new(:white, [7,col], self)
      else
        self[[7, col]] = King.new(:white, [7,col], self)
      end
    end

    #spawn pawns
    (0..7).each do |col|
      self[[1, col]] = Piece.new(:black, [1,col], self)
      self[[6, col]] = Piece.new(:white, [6,col], self)
    end
    
    (2..5).each do |row|
      (0..7).each do |col|
        self[[row, col]] = NullPiece.instance
      end
    end
    
    def valid_pos?(pos)
      pos.all? {|coor| coor.between?(0,7)}
    end
  end
  
  def inspect
  end
end