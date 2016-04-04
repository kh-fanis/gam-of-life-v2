require_relative './cell'

class Grid
  @@DEFAULT_WIDTH  = 8
  @@DEFAULT_HEIGHT = 8

  def initialize height = @@DEFAULT_WIDTH, width = @@DEFAULT_HEIGHT
    @cells = Array.new(height, Array.new(width, Cell.new))
  end

  def cell_at y, x
    @cells[y][x]
  end

  def width
    @cells.count
  end

  def height
    @cells[0].count
  end

  def to_s
    "#<Grid:#{__id__} width:#{width}, height:#{height}>"
  end
end