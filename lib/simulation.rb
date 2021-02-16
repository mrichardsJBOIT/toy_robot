#!/usr/bin/ruby
# frozen_string_literal: true

require "English"
require_relative 'square_table_top'
require_relative 'robot'
require_relative 'command'

class Simulation

  attr_reader :robot, :table, :commands

  def initialize
    @table = SquareTableTop.new(5)
    @robot = Robot.new(table)
    @commands = []
  end

  def do(command = nil)
    input = command.split(' ')
    if input.length > 1 # ugly ugly hack for place...
      input_args = input[1].split(',')
      args = { x_ord: input_args[0],
               y_ord: input_args[1],
               facing: input_args[2] }
    end
    com = Command.new(input[0], args)
    @commands.push(com)
  end

  def run
    @commands.each do |com|
      @robot.do(com)
    end
  end

  def report
    @robot.report
  end

end


