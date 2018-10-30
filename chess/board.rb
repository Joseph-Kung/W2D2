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
    
    #spawn non-pawn black pieces
    (0..7).each do |col|
      if col == 0 || col == 7
        self[[0, col]] = Rook.new(:black, [row,col], self.grid)
      elsif col == 1 || col == 6
        self[[0, col]] = Knight.new(:black, [row,col], self.grid)
      elsif col == 2 || col == 5
        self[[0, col]] = Bishop.new(:black, [row,col], self.grid)
      elsif col == 4
        self[[0, col]] = Queen.new(:black, [row,col], self.grid)
      else
        self[[0, col]] = King.new(:black, [row,col], self.grid)
      end
    end
    
    #spawn non-pawn white pieces
    (0..7).each do |col|
      if col == 0 || col == 7
        self[[7, col]] = Rook.new(:white, [row,col], self.grid)
      elsif col == 1 || col == 6
        self[[7, col]] = Knight.new(:white, [row,col], self.grid)
      elsif col == 2 || col == 5
        self[[7, col]] = Bishop.new(:white, [row,col], self.grid)
      elsif col == 4
        self[[7, col]] = Queen.new(:white, [row,col], self.grid)
      else
        self[[7, col]] = King.new(:white, [row,col], self.grid)
      end
    end

    #spawn pawns
    (0..7).each do |col|
      self[[1, col]] = Piece.new(:black, [row,col], self.grid)
      self[[6, col]] = Piece.new(:white, [row,col], self.grid)
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
end