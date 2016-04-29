require_relative '../../errors'
require_relative '../../models/grid'
require_relative './neighbors_servise'

# Inneed to generate new generations of grid
module GridGenerator

  # generates next generation
  def self.generate! grid
    raise NoGridSetError unless grid.instance_of? Grid

    cells_to_toggle = []

    grid.cells.each_with_index do |row, row_i|
      row.each_with_index do |cell, cell_i|
        alive_neighbors_count = NeighborsServise.find_alive_neighbors(grid, row_i, cell_i).count

        if (cell.alive? && !alive_neighbors_count.between?(2, 3)) || (cell.dead? && alive_neighbors_count.eql?(3))
          cells_to_toggle << cell
        end
      end
    end

    cells_to_toggle.each(&:toggle!)

    grid
  end

end