class Move < Base
  def call
    robot.position&.move
  end
end
