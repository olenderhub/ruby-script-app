require './lib/interpreter'
require './lib/robot'
require './lib/table'
require './lib/position'
require './lib/robot_commands/base'
require './lib/robot_commands/left'
require './lib/robot_commands/right'
require './lib/robot_commands/move'
require './lib/robot_commands/report'
require './lib/robot_commands/place'

describe Interpreter do
  let(:robot)            { Robot.new }
  let(:table)            { Table.new(5, 5) }
  let(:stubbed_position) { Position.new(table, 5, 5, 'SOUTH') }

  subject { Interpreter.new(robot, table) }

  describe '#call' do
    context 'with valid command' do
      it 'invokes LEFT command' do
        allow(Left).to receive_message_chain(:new, :call).and_return(stubbed_position)
        expect(subject.call('LEFT')).to eq stubbed_position
      end

      it 'invokes MOVE command' do
        allow(Move).to receive_message_chain(:new, :call).and_return(stubbed_position)
        expect(subject.call('MOVE')).to eq stubbed_position
      end

      it 'invokes PLACE command' do
        allow(Place).to receive_message_chain(:new, :call).and_return(stubbed_position)
        expect(subject.call('PLACE 5,5,SOUTH')).to eq stubbed_position
      end

      it 'invokes REPORT command' do
        allow(Report).to receive_message_chain(:new, :call).and_return(stubbed_position)
        expect(subject.call('REPORT')).to eq stubbed_position
      end

      it 'invokes RIGHT command' do
        allow(Right).to receive_message_chain(:new, :call).and_return(stubbed_position)
        expect(subject.call('RIGHT')).to eq stubbed_position
      end
    end

    context 'with invalid command' do
      it 'returns nil' do
        expect(subject.call('WRONG COMMAND')).to be_nil
      end
    end
  end

  describe 'main_command' do
    context 'with valid main command' do
      it 'returns PLACE as main command' do
        subject.instance_variable_set(:@input_command, 'PLACE ARGS')
        expect(subject.send(:main_command)).to eq 'PLACE'
      end

      it 'returns LEFT as main command' do
        subject.instance_variable_set(:@input_command, 'LEFT')
        expect(subject.send(:main_command)).to eq 'LEFT'
      end
    end

    context 'with invalid input command' do
      it 'returns nil' do
        subject.instance_variable_set(:@input_command, ' LEFT')
        expect(subject.send(:main_command)).to be_nil
      end
    end
  end

  describe 'position_from_input_command' do
    context 'with valid input command' do
      it 'returns position' do
        subject.instance_variable_set(:@table, table)
        subject.instance_variable_set(:@input_command, 'PLACE 2,2,SOUTH')
        allow(Position).to receive(:new).and_return(stubbed_position)
        expect(subject.send(:position_from_input_command)).to eq stubbed_position
      end
    end

    context 'with invalid main command' do
      it 'returns nil' do
        subject.instance_variable_set(:@input_command, 'WRONG INPUT COMMAND')
        expect(subject.send(:position_from_input_command)).to be_nil
      end
    end
  end
end
