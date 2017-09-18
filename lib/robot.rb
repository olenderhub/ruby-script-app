class Robot
  attr_reader :position

  def add_position(position)
    @position = position if position.is_valid?
  end
end
