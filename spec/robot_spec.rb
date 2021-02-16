require 'rspec'
require 'robot'
require 'command'
require 'square_table_top'

describe 'Robot' do

  before do
    @table = SquareTableTop.new(5)
  end

  context 'when created' do
    it 'will face nowhere and with no direction' do
      robot = Robot.new(@table)
      expect(robot.facing).to be == nil
      expect(robot.location).to be == [nil, nil]
    end
  end

  context 'when danger' do
    it 'tells Will' do
      robot = Robot.new(@table)
      expect(robot.warning).to eq 'DANGER WILL ROBINSON'
    end
  end

  context 'when placed' do
    it 'knows position' do
      robot = Robot.new(@table)
      robot.place({ x_ord: 0, y_ord: 0, facing: 'NORTH' })
      expect(robot.location).to eq [0, 0]
    end
  end

  context 'given a command' do
    it 'runs a command with no args' do
      robot = Robot.new(@table)
      command = Command.new('MOVE')
      run_command = true
      begin
        robot.do(command)
      rescue StandardError
        run_command = false
      end
      expect(run_command).to be true
    end

    it 'runs a command with args' do
      robot = Robot.new(@table)
      command = Command.new('PLACE', { x_ord: 1, y_ord: 1, facing: 'SOUTH' })
      run_command = true
      begin
        robot.do(command)
      rescue StandardError
        run_command = false
      end
      expect(run_command).to be true
    end
  end

  context 'when told to turn' do

    it 'should turn right north to east' do
      robot = Robot.new(@table, 0,0, 'NORTH')
      robot.right
      expect(robot.facing).to be == 'EAST'
    end

    it 'should turn right west to north' do
      robot = Robot.new(@table, 0,0,  'WEST')
      robot.right
      expect(robot.facing).to be == 'NORTH'
    end

    it 'should turn left north to west' do
      robot = Robot.new(@table, 0,0, 'NORTH')
      robot.left
      expect(robot.facing).to be == 'WEST'
    end

    it 'should turn left west to south' do
      robot = Robot.new(@table, 0,0, 'WEST')
      robot.left
      expect(robot.facing).to be == 'SOUTH'
    end
  end

  context 'when moving' do
    it 'should go north' do
      robot = Robot.new(@table, 0,0, 'NORTH')
      command = Command.new('PLACE', { x_ord: 0, y_ord: 0, facing: 'NORTH' })
      robot.do(command)
      robot.move
      expect(robot.location).to eq [0, 1]
    end

    it 'should not go off the table ' do
      robot = Robot.new(@table)
      command = Command.new('PLACE', { x_ord: 5, y_ord: 5, facing: 'NORTH' })
      robot.do(command)
      robot.move
      expect(robot.location).to eq [5, 5]
    end
  end
end
