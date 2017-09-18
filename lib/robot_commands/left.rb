class Left < Base
  def call
    robot.position&.turn_left
  end
end
