require 'byebug'

module SlidingPiece
  def move_dirs
    
    horizontal_moves = self.right_horizontal_pos + self.left_horizontal_pos
    vertical_moves = self.up_vertical_pos + self.down_vertical_pos
    diagonal_moves = self.up_left_diagonal_pos + self.up_right_diagonal_pos + self.down_left_diagonal_pos + self.down_right_diagonal_pos
    
    if self.class == Rook
      possible_moves = horizontal_moves + vertical_moves
    elsif self.class == Bishop
      possible_moves = diagonal_moves
    elsif self.class == Queen
      possible_moves = horizontal_moves + vertical_moves + diagonal_moves
    end
    possible_moves
  end
  
  #private
  
  def right_horizontal_pos
    row, col = self.pos
    moves = []
    
    found = false
    until col == 7 || found == true
      col += 1
      if @board[[row, col]].class == NullPiece
        moves << [row, col]
      elsif @board[[row, col]].color != self.color
        moves << [row, col]
        found = true
      else
        found = true
      end
    end
    moves
  end
  
  def left_horizontal_pos
    row, col = self.pos
    moves = []
    
    found = false
    until col == 0 || found == true
      col -= 1
      if @board[[row, col]].class == NullPiece
        moves << [row, col]
      elsif @board[[row, col]].color != self.color
        moves << [row, col]
        found = true
      else
        found = true
      end
    end
    moves
  end
  
  def up_vertical_pos
    row, col = self.pos
    moves = []
    
    found = false
    until row == 0 || found == true
      row -= 1
      if @board[[row, col]].class == NullPiece
        moves << [row, col]
      elsif @board[[row, col]].color != self.color
        moves << [row, col]
        found = true
      else
        found = true
      end
    end
    moves
  end
  
  def down_vertical_pos
    row, col = self.pos
    moves = []
    
    found = false
    until row == 7 || found == true
      row += 1
      if @board[[row, col]].class == NullPiece
        moves << [row, col]
      elsif @board[[row, col]].color != self.color
        moves << [row, col]
        found = true
      else
        found = true
      end
    end
    moves
  end
  
  def up_right_diagonal_pos
    row, col = self.pos
    moves = []
    
    found = false
    until row == 0 || col == 7 || found == true
      row -= 1
      col += 1
      if @board[[row, col]].class == NullPiece
        moves << [row, col]
      elsif @board[[row, col]].color != self.color
        moves << [row, col]
        found = true
      else
        found = true
      end
    end
    moves
  end
  
  def down_right_diagonal_pos
    row, col = self.pos
    moves = []
    
    found = false
    until row == 7 || col == 7 || found == true
      row += 1
      col += 1
      if @board[[row, col]].class == NullPiece
        moves << [row, col]
      elsif @board[[row, col]].color != self.color
        moves << [row, col]
        found = true
      else
        found = true
      end
    end
    moves
  end
  
  def up_left_diagonal_pos
    row, col = self.pos
    moves = []
    
    found = false
    until row == 0 || col == 0 || found == true
      row -= 1
      col -= 1
      if @board[[row, col]].class == NullPiece
        moves << [row, col]
      elsif @board[[row, col]].color != self.color
        moves << [row, col]
        found = true
      else
        found = true
      end
    end
    moves
  end
  
  def down_left_diagonal_pos
    row, col = self.pos
    moves = []
    found = false
    byebug
    until row == 7 || col == 0 || found == true
      row += 1
      col -= 1
      if @board[[row, col]].class == NullPiece
        moves << [row, col]
      elsif @board[[row, col]].color != self.color
        moves << [row, col]
        found = true
      else
        found = true
      end
    end
    moves
  end
end