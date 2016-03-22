require_relative '../../models/cell'

describe Cell do
  let(:dead_cell)  { Cell.new }
  let(:alive_cell) { Cell.new true }

  context 'initialization' do
    it 'should be dead' do
      expect(dead_cell).to be_dead
    end

    it 'should be alive' do
      expect(alive_cell).to be_alive
    end
  end

  context '#die' do
    it 'should die dead cell' do
      dead_cell.die!
      expect(dead_cell).to be_dead
    end

    it 'should die alive cell' do
      alive_cell.die!
      expect(alive_cell).to be_dead
    end
  end

  context '#revive' do
    it 'should revive dead cell' do
      dead_cell.revive!
      expect(dead_cell).to be_alive
    end

    it 'should revive alive cell' do
      alive_cell.revive!
      expect(alive_cell).to be_alive
    end
  end


  context '#toggle' do
    it 'should toggle dead cell' do
      dead_cell.toggle!
      expect(dead_cell).to be_alive
    end

    it 'should toggle alive cell' do
      alive_cell.toggle!
      expect(alive_cell).to be_dead
    end
  end
end