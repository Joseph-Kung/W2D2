require 'byebug'

module SteppingPiece
  def move_dirs
    
    if self.class == King
      possible_moves = king_moves
    elsif self.class == Knight
      possible_moves = knight_moves
    end
    
    possible_moves
  end
  
  #private
  
  def king_moves
    steps = [[-1,-1], [-1,0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1]]
    moves = []
    
    steps.each do |step|
      x, y = step
      row, col = self.pos
      x_shift = row + x
      y_shift = col + y
      next unless x_shift.between?(0, 7) && y_shift.between?(0, 7)
      if @board[[x_shift, y_shift]].class == NullPiece || @board[[x_shift, y_shift]].color != self.color
        moves << [x_shift, y_shift]
      end
    end
    
    moves
  end
  
  def knight_moves
    steps = [[-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1], [2, 1], [1, 2]]
    moves = []
    
    steps.each do |step|
      x, y = step
      row, col = self.pos
      x_shift = row + x
      y_shift = col + y
      next unless x_shift.between?(0, 7) && y_shift.between?(0, 7)
      if @board[[x_shift, y_shift]].class == NullPiece || @board[[x_shift, y_shift]].color != self.color
        moves << [x_shift, y_shift]
      end
    end
    
    moves
  end
end