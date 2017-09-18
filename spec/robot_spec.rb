require './lib/robot'
require './lib/table'
require './lib/position'

describe Robot do
  let(:table) { Table.new(5, 5) }
  subject { Robot.new }

  describe '#add_position' do
    context 'with valid position' do
      let(:position) { Position.new(table, 2, 2, 'SOUTH') }

      it 'returns position' do
        expect(subject.add_position(position)).to eq position
      end
    end

    context 'with invalid position' do
      let(:position) { Position.new(table, 10, 2, 'SOUTH') }

      it 'returns nil' do
        expect(subject.add_position(position)).to be_nil
      end
    end
  end
end
