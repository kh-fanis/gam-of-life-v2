require_relative '../../models/generation_log'
require_relative '../../models/generation'

require_relative '../file_to_grid'

require_relative '../../errors'

require_relative './grid_generator'

require_relative '../parsers/grid_parser'

class GameEngine
  attr_accessor :grid, :generation_log

  def initialize file_name
    @grid           = FileToGrid.convert(file_name)
    @generation_log = GenerationLog.new
  end

  def next!
    if !@generation_log.add(Generation.new(GridGenerator.generate!(grid))) or grid.all_dead?
      raise GenerationDiedError
    end

    data_to_render
  end

  def data_to_render
    { grid: GridParser.parse(@grid, alive: '*', dead: ' '), generation_number: (@generation_log.count + 1) }
  end
end