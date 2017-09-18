class Place < Base
  def call(position)
    robot.add_position(position)
  end
end
