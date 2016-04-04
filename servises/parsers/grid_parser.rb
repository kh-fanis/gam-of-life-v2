require_relative '../../models/grid'

class GridParser
  @@DEFAULT_ALIVE_CELL_REPLACEMENT = '1'
  @@DEFAULT_DEAD_CELL_REPLACEMENT  = '0'

  attr_reader :options

  def initialize grid, options = {}
    raise NoGridSetError unless grid.instance_of? Grid
    @grid, @options = grid, options
  end

  def self.parse grid, options = {}
    self.new(grid, options).parse
  end

  def parse options = {}
    @options = @options.merge(options)

    @grid.cells.map do |row|
      row.map do |cell|
        parse_cell(cell)
      end.join
    end.join("\n")
  end

  def parse_cell cell
    if cell.alive?
      parse_alive_cell
    else
      parse_dead_cell
    end
  end

  def parse_alive_cell
    unless @options[:alive].nil?
      @options[:alive]
    else
      @@DEFAULT_ALIVE_CELL_REPLACEMENT
    end
  end

  def parse_dead_cell
    unless @options[:dead].nil?
      @options[:dead]
    else
      @@DEFAULT_DEAD_CELL_REPLACEMENT
    end
  end

  class NoGridSetError < RuntimeError
  end
end