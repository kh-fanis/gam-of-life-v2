app_folder = '..'

# ['models', 'servises'].each do |folder|
#   Dir[File.join("#{app_folder}/#{folder}", '**/*.rb')].each { |f| require f }
# end

require_relative "#{app_folder}/models/cell"
require_relative "#{app_folder}/models/grid"

require_relative "#{app_folder}/models/generation"
require_relative "#{app_folder}/models/generation_log"

require_relative "#{app_folder}/servises/file_to_grid"

require_relative "#{app_folder}/servises/parsers/grid_parser"
require_relative "#{app_folder}/servises/parsers/string_to_grid_parser"

require_relative "#{app_folder}/servises/game_engine/neighbors_servise"
require_relative "#{app_folder}/servises/game_engine/grid_generator"
require_relative "#{app_folder}/servises/game_engine/game_engine"