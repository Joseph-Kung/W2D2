module SlidingPiece
  def move_dirs
    
    horizontal_moves = right_horizontal_pos(self.pos) + left_horizontal_pos(self.pos)
    vertical_moves = up_vertical_pos(self.pos) + down_vertical_pos(self.pos)
    diagonal_moves = up_left_diagonal_pos(self.pos) + up_right_diagonal_pos(self.pos) + down_left_diagonal_pos(self.pos) + down_right_diagonal_pos(self.pos)
    
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
  def right_horizontal_pos(start_pos)
    row, col = start_pos
    moves = []
    
    found = false
    until col > 7 || found = true
      if @board[[row,col]].class == NullPiece
        col += 1
        moves << [row, col]
      else
        found = true
      end
    end
    moves
  end
  
  def left_horizontal_pos(start_pos)
    row, col = start_pos
    moves = []
    
    found = false
    until col < 0 || found = true
      if @board[[row,col]].class == NullPiece
        col -= 1
        moves << [row, col]
      else
        found = true
      end
    end
    moves
  end
  
  def up_vertical_pos(start_pos)
    row, col = start_pos
    moves = []
    
    found = false
    until row < 0 || found = true
      if @board[[row,col]].class == NullPiece
        row -= 1
        moves << [row, col]
      else
        found = true
      end
    end
    moves
  end
  
  def down_vertical_pos(start_pos)
    row, col = start_pos
    moves = []
    
    found = false
    until row > 7 || found = true
      if @board[[row,col]].class == NullPiece
        row += 1
        moves << [row, col]
      else
        found = true
      end
    end
    moves
  end
  
  def up_right_diagonal_pos(start_pos)
    row, col = start_pos
    moves = []
    
    found = false
    until row < 0 || col > 7 || found = true
      if @board[[row,col]].class == NullPiece
        row -= 1
        col += 1
        moves << [row, col]
      else
        found = true
      end
    end
    moves
  end
  
  def down_right_diagonal_pos(start_pos)
    row, col = start_pos
    moves = []
    
    found = false
    until row > 7 || col > 7 || found = true
      if @board[[row,col]].class == NullPiece
        row += 1
        col += 1
        moves << [row, col]
      else
        found = true
      end
    end
    moves
  end
  
  def up_left_diagonal_pos(start_pos)
    row, col = start_pos
    moves = []
    
    found = false
    until row < 0 || col < 0 || found = true
      if @board[[row,col]].class == NullPiece
        row -= 1
        col -= 1
        moves << [row, col]
      else
        found = true
      end
    end
    moves
  end
  
  def down_left_diagonal_pos(start_pos)
    row, col = start_pos
    moves = []
    
    found = false
    until row > 7 || col < 0 || found = true
      if @board[[row,col]].class == NullPiece
        row += 1
        col -= 1
        moves << [row, col]
      else
        found = true
      end
    end
    moves
  end
end