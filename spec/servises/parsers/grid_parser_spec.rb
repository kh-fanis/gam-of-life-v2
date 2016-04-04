require_relative '../../spec_helper.rb'

describe GridParser do
  let(:grid) { Grid.new(5, 5) }
  let(:parser) { GridParser.new(grid) }
  let(:parser_with_no_deafult_replacements) { GridParser.new(grid, alive: '*') }

  before :each do
    (1..3).each { |x| grid.cell_at(2, x).revive! }
  end

  context '#parse' do
    it 'should render with default replacements' do
      expect(parser.parse).to eql("00000\n00000\n01110\n00000\n00000")
    end

    it 'should render by passing replacement char as argument' do
      expect(parser.parse(alive: '*', dead: '-')).to eql("-----\n-----\n-***-\n-----\n-----")
    end

    it 'should render the grid, when replacements set during creating' do
      expect(parser_with_no_deafult_replacements.parse).to eql("00000\n00000\n0***0\n00000\n00000")
    end
  end

  context '#parse_cell' do
    let(:dead_cell)  { Cell.new }
    let(:alive_cell) { Cell.new(true) }

    it 'should parse alive cell' do
      expect(parser.parse_cell(alive_cell)).to eql('1')
    end

    it 'should parse dead cell' do
      expect(parser.parse_cell(dead_cell)).to eql('0')
    end
  end

  context '.parse' do
    it 'should parse grid' do
      expect(GridParser.parse(grid)).to eql("00000\n00000\n01110\n00000\n00000")
    end
  end
end