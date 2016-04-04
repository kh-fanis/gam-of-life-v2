require_relative '../non_boolean_error'

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
end