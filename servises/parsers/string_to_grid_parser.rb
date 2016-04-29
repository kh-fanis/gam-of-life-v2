require_relative '../../models/cell'
require_relative '../../models/grid'

# Inneed to parse string to grid
module StringToGridParser
  def self.parse str
    rows  = str.split("\n")
    cells = rows.first.split(rows.include?(' ') ? ' ' : '')

    grid = Grid.new(rows.count, cells.count)

    str.split("\n").each_with_index do |row, row_i|
      row.chars.each_with_index do |cell, cell_i|
        grid.cell_at(row_i, cell_i).revive! if cell == '1'
      end
    end

    grid
  end
end