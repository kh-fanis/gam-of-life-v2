class Cell
  attr_accessor :toggle

  def initialize(state = false)
    @state = state
  end

  # 

  def revive!
    @state = true
  end

  def die!
    @state = false
  end

  def toggle!
    @state = !@state
  end

  # 

  def dead?
    @state == false
  end

  def alive?
    @state == true
  end
end