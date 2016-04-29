require_relative '../errors'

# Keeps state of cell
# Could be alive or dead
class Cell
  attr_accessor :state

  def initialize state = false
    raise NonBooleanError unless state.instance_of?  TrueClass or state.instance_of? FalseClass
    @state = state
  end

  def alive?
    @state
  end

  def dead?
    !@state
  end

  def revive!
    @state = true
  end

  def die!
    @state = false
  end

  def toggle!
    @state = !@state
  end

  # Better Object outputting
  def inspect
    "#<Cell:#{__id__} state:#{state ? :alive : :dead}>"
  end

  # Comparing
  def eql? other
    (other.alive? and alive?) or (other.dead? and dead?)
  end
end