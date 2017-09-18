require './lib/table'

describe Table do
  context 'creating' do
    subject { Table.new(width, height) }

    context 'with valid properties' do
      let(:width)  { 5 }
      let(:height) { 5 }

      it 'returns width' do
        expect(subject.width).to eq(width)
      end

      it 'returns height' do
        expect(subject.height).to eq(height)
      end
    end
  end
end
