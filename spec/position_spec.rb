require './lib/position'
require './lib/table'

describe Position do
  let(:table)  { Table.new(5, 5) }
  let(:x)      { 5 }
  let(:y)      { 5 }
  let(:facing) { 'SOUTH' }
  subject      { Position.new(table, x, y, facing) }

  describe '#is_valid?' do
    context 'when position is valid' do
      it 'returns true' do
        expect(subject.is_valid?).to be true
      end
    end

    context 'when position is invalid' do
      let(:y) { 6 }

      it 'returns false' do
        expect(subject.is_valid?).to be false
      end
    end
  end

  describe '#output' do
    it 'returns valid output' do
      expect(subject.output).to eq '5,5,SOUTH'
    end
  end

  describe '#turn_right' do
    before { subject.turn_right }

    context 'with SOUTH facing' do
      it 'returns WEST facing' do
        expect(subject.facing).to eq 'WEST'
      end
    end

    context 'with EAST facing' do
      let(:facing) { 'EAST' }

      it 'returns SOUTH facing' do
        expect(subject.facing).to eq 'SOUTH'
      end
    end

    context 'with NORTH facing' do
      let(:facing) { 'NORTH' }

      it 'returns EAST facing' do
        expect(subject.facing).to eq 'EAST'
      end
    end

    context 'with WEST facing' do
      let(:facing) { 'WEST' }

      it 'returns NORTH facing' do
        expect(subject.facing).to eq 'NORTH'
      end
    end
  end

  describe '#turn_left' do
    before { subject.turn_left }

    context 'with SOUTH facing' do
      it 'returns EAST facing' do
        expect(subject.facing).to eq 'EAST'
      end
    end

    context 'with EAST facing' do
      let(:facing) { 'EAST' }

      it 'returns NORTH facing' do
        expect(subject.facing).to eq 'NORTH'
      end
    end

    context 'with NORTH facing' do
      let(:facing) { 'NORTH' }

      it 'returns WEST facing' do
        expect(subject.facing).to eq 'WEST'
      end
    end

    context 'with WEST facing' do
      let(:facing) { 'WEST' }

      it 'returns SOUTH facing' do
        expect(subject.facing).to eq 'SOUTH'
      end
    end
  end

  describe '#move' do
    before { subject.move }

    context 'when can move' do
      context 'with 5, 5, SOUTH coordinates' do
        it 'returns y = 4' do
          expect(subject.y).to eq 4
        end
      end

      context 'with 2, 5, WEST coordinates' do
        let(:facing) { 'WEST' }
        let(:x)      { 2 }

        it 'returns x = 1' do
          expect(subject.x).to eq 1
        end
      end

      context 'with 1, 1, EAST coordinates' do
        let(:facing) { 'EAST' }
        let(:x)      { 1 }
        let(:y)      { 1 }

        it 'returns x = 2' do
          expect(subject.x).to eq 2
        end
      end

      context 'with 2, 3, NORTH coordinates' do
        let(:facing) { 'NORTH' }
        let(:x)      { 2 }
        let(:y)      { 3 }

        it 'returns y = 4' do
          expect(subject.y).to eq 4
        end
      end
    end

    context 'when can not move' do
      context 'with 5, 5, NORTH coordinates' do
        let(:facing) { 'NORTH' }

        it 'ignores command' do
          expect(subject.y).to eq 5
        end
      end

      context 'with 5, 5, EAST coordinates' do
        let(:facing) { 'EAST' }

        it 'ignores command' do
          expect(subject.x).to eq 5
        end
      end

      context 'with 0, 0, WEST coordinates' do
        let(:facing) { 'WEST' }
        let(:x)      { 0 }
        let(:y)      { 0 }

        it 'ignores command' do
          expect(subject.x).to eq 0
        end
      end

      context 'with 0, 0, SOUTH coordinates' do
        let(:facing) { 'SOUTH' }
        let(:x)      { 0 }
        let(:y)      { 0 }

        it 'ignores command' do
          expect(subject.y).to eq 0
        end
      end
    end
  end
end
