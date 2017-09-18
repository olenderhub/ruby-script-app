require './lib/robot_commands/base'
require './lib/robot_commands/right'
require './lib/robot'
require './lib/position'
require './lib/table'

describe Right do
  let(:robot) { Robot.new }
  subject     { Right.new(robot) }

  describe '#call' do
    context 'without the coordinates of the robot' do
      it 'returns empty position' do
        expect(subject.call).to be_nil
      end
    end

    context 'with the coordinates of the robot' do
      let(:table)            { Table.new(5, 5) }
      let(:position)         { Position.new(table, 5, 5, 'SOUTH') }
      let(:stubbed_position) { Position.new(table, 5, 5, 'EAST') }
      before                 { robot.add_position(position) }

      it 'returns correct position' do
        allow_any_instance_of(Position).to receive(:turn_right).and_return(stubbed_position)
        expect(subject.call).to eq stubbed_position
      end
    end
  end
end
