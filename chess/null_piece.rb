require_relative 'Piece'
require 'singleton'

class NullPiece < Piece
  include Singleton
  
  def initialize
    @color = :invisible
    @symbol = "   "
  end
end