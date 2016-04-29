require_relative '../spec_helper'

describe Cell do
  let(:cell) { Cell.new }
  let(:alive_cell) { Cell.new(true) }

  context '#new' do
    it 'should be dead' do
      expect(cell).to be_dead
    end

    it 'should return alive cell by passing true' do
      expect(alive_cell).to be_alive
    end

    it 'should raise error by passing non boolean object' do
      expect { Cell.new(Object.new) }.to raise_error NonBooleanError
    end
  end

  context '#die!' do
    it 'dies when it\'s dead' do
      cell.die!
      expect(cell).to be_dead
    end

    it 'dies when it\'s alive' do
      alive_cell.die!
      expect(alive_cell).to be_dead
    end
  end


  context '#revive!' do
    it 'dies when it\'s dead' do
      cell.revive!
      expect(alive_cell).to be_alive
    end

    it 'dies when it\'s alive' do
      alive_cell.revive!
      expect(alive_cell).to be_alive
    end
  end

  context '#toggle!' do
    it 'dies when it\'s dead' do
      cell.toggle!
      expect(alive_cell).to be_alive
    end

    it 'dies when it\'s alive' do
      alive_cell.toggle!
      expect(alive_cell).to be_dead
    end
  end

  context '#eql?' do
    it 'should be the same another dead cell' do
      expect(cell).to be_eql(Cell.new)
    end

    it 'should be the same another dead cell' do
      expect(alive_cell).to be_eql(Cell.new(true))
    end
  end
end