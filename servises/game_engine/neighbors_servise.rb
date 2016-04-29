require_relative '../../errors'
require_relative '../../models/grid'

# Inneed to find neighbors around the cell
module NeighborsServise

  # finds all neighbors of cell
  def self.find_neighbors grid, y, x
    raise NoGridSetError unless grid.instance_of? Grid

    calculate_coordinates(y, x).map do |coordinates|
      correct_coordinates(coordinates, grid.height, grid.width)
    end.compact.map do |coordinates|
      grid.cell_at(coordinates[0], coordinates[1])
    end
  end

  # finds alive neighbors of cell
  def self.find_alive_neighbors grid, y,  x
    find_neighbors(grid, y, x).map { |cell| cell if cell.alive? }.compact
  end

  # finds dead neighbors of cell
  def self.find_dead_neighbors grid, y,  x
    find_neighbors(grid, y, x).map { |cell| cell if cell.dead? }.compact
  end

private

  # returns closer coordinates
  def self.calculate_coordinates y, x
    [
      [y - 1, x - 1], [y - 1, x], [y - 1, x + 1],
      
      [y    , x - 1],             [y    , x + 1],
      
      [y + 1, x - 1], [y + 1, x], [y + 1, x + 1]
    ]
  end

  # corrects cordinates returning nil if coordinate is impossible
  def self.correct_coordinates coordinates, height, width
    coordinates unless coordinates[0] < 0 || coordinates[0] > height - 1 || coordinates[1] < 0 || coordinates[1] > width - 1
  end

end