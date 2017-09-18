require './lib/robot_commands/base'
require './lib/robot'

describe Base do
  describe 'creating' do
    context 'without robot' do
      it 'raises error' do
        expect { Base.new }.to raise_error ArgumentError
      end
    end

    context 'with robot' do
      let(:robot) { Robot.new }

      it 'returns robot' do
        expect(Base.new(robot).robot).to eq robot
      end
    end
  end
end
