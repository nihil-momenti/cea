#!/usr/bin/env ruby

require './lib/cea'
require './data'

require 'rubygems'
require 'colorize'

correct_case = (ARGV[0] || :soft).to_sym
algo = CEA::Algorithm.new(Assignment::Data::Attributes)

puts "S:".red
puts algo.S.to_s.chomp
puts "G:".red
puts algo.G.to_s.chomp

Assignment::Data::Examples.each do |kase, example|
  gets # Pause before each example

  prior = algo.classify example

  if kase == correct_case
    algo.add_positive_example example
  else
    algo.add_negative_example example
  end

  after = algo.classify example

  puts "Example:             ".red
  puts "   #{ example.inspect } ==> #{ kase }"
  puts "Prior Classification:".red + " #{ prior }"
  puts "After Classification:".red + " #{ after }"
  puts "----"
  puts "S:".red
  puts algo.S.to_s.chomp
  puts "G:".red
  puts algo.G.to_s.chomp
end
