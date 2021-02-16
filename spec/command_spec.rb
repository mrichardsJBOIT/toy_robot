require 'rspec'
require 'command'

describe 'Command' do

  context 'when illegal' do
    it 'throws exception' do
      expect { Command.new("WRONG") }.to raise_error.with_message('ILLEGAL COMMAND')
    end
  end

  context 'when legal' do
    it 'is created' do
      args = { x_ord: 0, y_ord: 1, facing: 'NORTH' }
      expect(Command.new('PLACE', args).command).to be == 'PLACE'
      expect(Command.new('PLACE', args).args[:x_ord]).to be == 0
      expect(Command.new('PLACE', args).args[:y_ord]).to be == 1
      expect(Command.new('PLACE', args).args[:facing]).to be == 'NORTH'
      expect(Command.new('MOVE').command).to be == 'MOVE'
      expect(Command.new('LEFT').command).to be == 'LEFT'
      expect(Command.new('RIGHT').command).to be == 'RIGHT'
      expect(Command.new('REPORT').command).to be == 'REPORT'
    end
  end

end
