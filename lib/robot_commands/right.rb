class Right < Base
  def call
    robot.position&.turn_right
  end
end
