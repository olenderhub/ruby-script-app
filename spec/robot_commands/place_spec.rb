require './lib/robot_commands/base'
require './lib/robot_commands/place'
require './lib/robot'
require './lib/position'
require './lib/table'

describe Place do
  let(:robot) { Robot.new }
  subject     { Place.new(robot) }

  describe '#call' do
    let(:table)    { Table.new(5, 5) }
    let(:position) { Position.new(table, 5, 5, 'SOUTH') }

    it 'returns correct position' do
      allow_any_instance_of(Robot).to receive(:add_position).and_return(position)
      expect(subject.call(position)).to eq position
    end
  end
end

