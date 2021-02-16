#!/usr/bin/ruby
# frozen_string_literal: true

require "English"
require_relative '../lib/square_table_top'
require_relative '../lib/robot'
require_relative '../lib/command'
require_relative '../lib/simulation'

sim = Simulation.new
puts 'hi dave...'
until STDIN.gets.chomp == 'REPORT'
  begin
    sim.do($LAST_READ_LINE)
  rescue RuntimeError => e
    puts "oops...#{e.message}"
    break
  end
end
sim.run
sim.report

puts 'bye dave...'
