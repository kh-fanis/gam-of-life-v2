require_relative '../spec_helper'

describe Grid do
  let(:grid) { Grid.new }

  context '#new' do
    context 'should return grid 8x8 by passing no attributes' do
      it 'should have 8x8 items inside' do
        expect(grid.width).to eql(8)
        expect(grid.height).to eql(8)
      end

      it 'should have no alive cell inside' do
        0.upto(7) { |y|
          0.upto(7) { |x|
            expect(grid.cell_at(y, x)).to be_dead
          }
        }
      end
    end

    context 'should return grid by passing width and height' do
      let(:grid) { Grid.new(4, 4) }

      it 'should have 4x4 items inside' do
        expect(grid.height).to eql(4)
        expect(grid.width).to eql(4)
      end
    end
  end

  context '#eql?' do
    it 'should be the same another grid' do
      expect(grid).to be_eql(Grid.new)
    end
  end
end