require "colorize"
require_relative "cursor"


class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end
  
  def play
    while true
      render
      @cursor.get_input
      system("clear")
    end
  end
  
  def render
    @board.grid.each_with_index do |row, i|
      puts render_row(row, i)
    end
    
    inspect
  end
  
  def render_row(row, i)
    cursor_pos = @cursor.cursor_pos
    
    result = ""
    row.each_with_index do |piece, idx|
      if piece.is_a?(NullPiece)
        if cursor_pos == [i, idx]
          result << "#{piece.symbol}".colorize(:background => :red)
        else
          result << "#{piece.symbol}"
        end
      else
        if cursor_pos == [i, idx]
          result << " #{piece.symbol} ".colorize(:color => piece.color, :background => :red)
        else
          result << " #{piece.symbol} ".colorize(:color => piece.color)
        end
      end
    end
    result
  end
  
  def inspect
  end
end