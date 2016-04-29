require_relative './cell'

# Keeps cells inside
class Grid
  @@DEFAULT_WIDTH  = 8
  @@DEFAULT_HEIGHT = 8

  attr_reader :cells

  def initialize height = @@DEFAULT_WIDTH, width = @@DEFAULT_HEIGHT
    @cells = Array.new(height) { Array.new(width) { Cell.new } }
  end

  def cell_at y, x
    @cells[y][x]
  end

  def height
    @cells.count
  end

  def width
    @cells[0].count
  end

  # checking all cells inside are dead?
  def all_dead?
    @cells.flatten.select(&:alive?).count == 0
  end

  # Better Object outputting
  def inspect
    "#<Grid:#{__id__} width:#{width}, height:#{height}>"
  end

  # Comparing
  def eql? other
    if other.height == height and other.width == width
      (0...height).map do |row|
        (0...width).map do |cell|
          cell_at(row, cell).eql?(other.cell_at(row, cell))
        end
      end
    end
  end
end