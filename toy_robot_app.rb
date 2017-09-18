Dir["./lib/*.rb"].each                {|file| require file }
Dir["./lib/robot_commands/*.rb"].each {|file| require file }

table       = Table.new(5, 5)
robot       = Robot.new
interpreter = Interpreter.new(robot, table)

puts 'Welcome to Toy Robot Application!'

loop do
  puts 'Please type your command'
  input_command = STDIN.gets&.chomp

  break if input_command == 'EXIT' || input_command.nil?

  called_input_command = interpreter.call(input_command)
  puts called_input_command.output if input_command == 'REPORT' && called_input_command
end
