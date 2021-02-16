require 'rspec'
require 'simulation'

describe 'Simulation' do

  context 'when new' do
    it 'has default table and robot' do
      sim = Simulation.new
      expect(sim.robot).to be_a Robot
      expect(sim.table).to be_a SquareTableTop
    end
  end

  context 'when adding commands' do
    it 'can read the place command with arguments' do
      first_command = 'PLACE 0,0,NORTH'
      sim = Simulation.new
      sim.do(first_command)
      command = sim.commands[0]
      expect(command.command).to be == 'PLACE'
    end

    it 'maintains a list of those commands' do
      first_command = 'PLACE 0,0,NORTH'
      last_command = 'REPORT'
      sim = Simulation.new
      sim.do(first_command)
      sim.do(last_command)
      expect(sim.commands.length).to be == 2
    end

  end
end
