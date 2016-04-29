require_relative '../spec_helper'

describe FileToGrid do
  it 'should open the file' do

    expect(FileToGrid.open_file(:example_for_test)).to eql("00000\n00000\n01110\n00000\n00000")
  end

  context '.load' do
    let(:grid) { Grid.new(5, 5) }

    before { 1.upto(3) { |x| grid.cell_at(2, x).revive! } }

    it 'should load return the grid' do
      expect(FileToGrid.convert(:first)).to be_eql(grid)
    end
  end
end