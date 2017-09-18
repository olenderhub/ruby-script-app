require './lib/robot_commands/base'
require './lib/robot_commands/report'
require './lib/robot'
require './lib/position'
require './lib/table'

describe Report do
  let(:robot) { Robot.new }
  subject     { Report.new(robot) }

  describe '#call' do
    context 'without the coordinates of the robot' do
      it 'returns empty position' do
        expect(subject.call).to be_nil
      end
    end

    context 'with the coordinates of the robot' do
      let(:table)    { Table.new(5, 5) }
      let(:position) { Position.new(table, 5, 5, 'SOUTH') }
      before         { robot.add_position(position) }

      it 'returns correct position' do
        expect(subject.call).to eq position
      end
    end
  end
end
