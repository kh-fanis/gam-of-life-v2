require_relative '../../errors'
require_relative '../../models/grid'

# Inneed to parse grid to string
class GridParser

  # Default cell replacement chars
  @@DEFAULT_ALIVE_CELL_REPLACEMENT = '1'
  @@DEFAULT_DEAD_CELL_REPLACEMENT  = '0'

  # options attribute keeps default replacement of alive and dead cells
  #         it's hash and should be like:
  #                                       -> { alive: '*', dead: ' ' }
  attr_reader :options

  # if options are not set uses deafalut see upper
  def initialize grid, options = {}
    raise NoGridSetError unless grid.instance_of? Grid
    @grid, @options = grid, options
  end

  # class method to easialy parse grid to string
  def self.parse grid, options = {}
    self.new(grid, options).parse
  end

  # returns parsed grid as string
  def parse options = {}
    @options = @options.merge(options)

    @grid.cells.map do |row|
      row.map do |cell|
        parse_cell(cell)
      end.join
    end.join("\n")
  end

  # parses cell
  def parse_cell cell
    if cell.alive?
      parse_alive_cell
    else
      parse_dead_cell
    end
  end

  # returns char for alive cell
  def parse_alive_cell
    unless @options[:alive].nil?
      @options[:alive]
    else
      @@DEFAULT_ALIVE_CELL_REPLACEMENT
    end
  end

  # returns char for dead cell
  def parse_dead_cell
    unless @options[:dead].nil?
      @options[:dead]
    else
      @@DEFAULT_DEAD_CELL_REPLACEMENT
    end
  end
end