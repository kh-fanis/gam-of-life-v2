require_relative '../../spec_helper'

describe StringToGridParser do
  let(:grid) { Grid.new(5, 5) }

  before :each do
    0.upto(3) { |x| grid.cell_at(2, x).revive! }
  end

  it 'should parse string to grid with no options by deafult' do
    expect(StringToGridParser.parse("00000\n00000\n01110\n00000\n00000")).to be_eql(grid)
  end
end