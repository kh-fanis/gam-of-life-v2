require_relative '../../spec_helper'

describe GridGenerator do
  context 'first example' do
    before :all do
      # initializing inneed objects
      @grid = Grid.new(5, 5)

      1.upto(3) { |x| @grid.cell_at(2, x).revive! }
    end

    it 'should raise error if grid not taken' do
      expect { GridGenerator.generate!(Object.new) }.to raise_error NoGridSetError
    end

    it 'should generate second generation' do
      expect(GridParser.parse(GridGenerator.generate!(@grid))).to eql("00000\n00100\n00100\n00100\n00000")
    end

    it 'should generate third generation' do
      expect(GridParser.parse(GridGenerator.generate!(@grid))).to eql("00000\n00000\n01110\n00000\n00000")
    end
  end
end