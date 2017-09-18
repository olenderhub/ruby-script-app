class Interpreter
  attr_reader :robot, :table, :input_command

  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  def call(input_command)
    @input_command = input_command

    case main_command
    when 'LEFT'
      Left.new(robot).call
    when 'MOVE'
      Move.new(robot).call
    when 'PLACE'
      Place.new(robot).call(@position_from_input_command) if position_from_input_command
    when 'REPORT'
      Report.new(robot).call
    when 'RIGHT'
      Right.new(robot).call
    end
  end

  private

  def main_command
    matched = /^[A-Z]+/.match(@input_command)
    matched[0] if matched
  end

  def position_from_input_command
    if command_position_args = /(^[0-9]+)(,)([0-9]+)(,)(EAST|NORTH|SOUTH|WEST)/.match(input_command.split()[1])
      x                            = command_position_args[1].to_i
      y                            = command_position_args[3].to_i
      facing                       = command_position_args[5]
      @position_from_input_command = Position.new(table, x, y, facing)
    end
  end
end
