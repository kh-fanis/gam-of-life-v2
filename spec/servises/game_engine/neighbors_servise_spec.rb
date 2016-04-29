require_relative '../../spec_helper'

describe NeighborsServise do
  let(:grid) { Grid.new }

  before do
    1.upto(3) { |x| grid.cell_at(2, x).revive! }
  end

  context '.find_neighbors' do
    it 'should find 3 neighbors' do
      expect(NeighborsServise.find_neighbors(grid, 0, 0)).to eql(
        [
          grid.cell_at(0, 1),
          grid.cell_at(1, 0),
          grid.cell_at(1, 1)
        ]
      )
    end

    it 'should find 5 neighbors' do
      expect(NeighborsServise.find_neighbors(grid, 0, 1)).to eql(
        [
          grid.cell_at(0, 0),                     grid.cell_at(0, 2),
          grid.cell_at(1, 0), grid.cell_at(1, 1), grid.cell_at(1, 2)
        ]
      )
    end

    it 'should find 8 neighbors' do
      expect(NeighborsServise.find_neighbors(grid, 1, 1)).to eql(
        [
          grid.cell_at(0, 0), grid.cell_at(0, 1), grid.cell_at(0, 2),
          grid.cell_at(1, 0),                     grid.cell_at(1, 2),
          grid.cell_at(2, 0), grid.cell_at(2, 1), grid.cell_at(2, 2)
        ]
      )
    end
  end

  context '.find_alive_neighbors' do
    it 'should find alive neighbors of grid' do
      expect(NeighborsServise.find_alive_neighbors(grid, 1, 1).count).to eql(2)
    end
  end

  context '.find_dead_neighbors' do
    it 'should find alive neighbors of grid' do
      expect(NeighborsServise.find_dead_neighbors(grid, 1, 1).count).to eql(6)
    end
  end
end