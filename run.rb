#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'

require 'colorize'

require './lib/cea'
require './data'

def run
  init_args
  all_examples
end

def colourise_classification classification
  case classification
  when :positive
    classification.to_s.green
  when :unknown
    classification.to_s.magenta
  when :negative
    classification.to_s.red
  end
end

def init_args
  @correct_case = (ARGV[0] || :soft).to_sym
  @algo = CEA::Algorithm.new(Assignment::Data::Attributes)
end

def print_algo
  puts "S:"
  puts @algo.S.to_s.chomp
  puts "G:"
  puts @algo.G.to_s.chomp
end

def all_examples
  print_algo
  puts
  puts "Press enter to step through each example, Ctrl+D to continue to end"

  Assignment::Data::Examples.each do |kase, example|
    gets # Pause before each example

    prior = colourise_classification @algo.classify example

    if kase == @correct_case
      @algo.add_positive_example example
      example_colour = :light_green
    else
      @algo.add_negative_example example
      example_colour = :light_red
    end

    after = colourise_classification @algo.classify example

    puts "Example:" + " #{ example.inspect } ==> #{ kase }".send(example_colour)
    puts "Prior Classification:" + " #{ prior }"
    puts "After Classification:" + " #{ after }"
    puts "----"
    print_algo
  end
end

run
