require_relative './parsers/string_to_grid_parser'

module FileToGrid
  def self.open_file file_name, type = '.game_file'
    file_name = file_name.to_s + type unless file_name.to_s.include?(type)

    string_matrix = nil

    File.open "#{File.dirname(__FILE__)}/../examples/#{file_name}" do |file|
      string_matrix = file.read
    end

    string_matrix
  end

  def self.convert file_name
    string_to_grid open_file file_name
  end

  def self.string_to_grid str
    StringToGridParser.parse(str)
  end
end