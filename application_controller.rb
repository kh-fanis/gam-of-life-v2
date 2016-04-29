require_relative 'views/view.rb'
require_relative 'servises/game_engine/game_engine'
require_relative 'errors'

class ApplicationController
  def initialize
  end

  def run
    render :welcome
    file_name = gets[0...-1]

    game_engine = GameEngine.new(file_name)

    while true
      render :show_grid, game_engine.data_to_render
      sleep 1
      game_engine.next!
    end

  rescue GenerationDiedError
    render :exit
  end

private

  def render name, data = {}
    view = View.new(name, data)
    view.render
  end
end