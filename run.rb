#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'

require 'colorize'

require './lib/cea'
require './data'

def run
  options = init_args
  case options[:task]
  when :train
    case options[:number]
    when :all
      train options[:class]
    else
      train options[:class], options[:number]
    end
  when :classify
  end

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
  options = {}

  OptionParser.new do |opts|
    opts.banner = "Usage: #{__FILE__} [options]"

    options[:task] = :train #, :classify
    options[:number] = :all
    options[:class] = :soft

    opts.on '-t', '--task TASK', 'Which task to perform, default = train' do |task|
      options[:task] = task.to_sym
      options[:number] = 10 if task == 'classify'
    end

    opts.on '-n', '--number NUMBER', 'How many examples to use, default = all for training, 10 for classifying' do |number|
      options[:number] = number.to_i
    end

    opts.on '-c', '--class CLASS', 'Which class to train on, only applicable for the training task, default = soft' do |klass|
      options[:class] = klass.to_sym
    end

    opts.on '-h', '--help', 'Display this screen' do
      puts opts
      exit
    end
  end.parse!

  options
end

def print_algo algo
  puts "S:"
  puts algo.S.to_s.chomp
  puts "G:"
  puts algo.G.to_s.chomp
end

def train correct_case, number=nil
  algo = CEA::Algorithm.new(Assignment::Data::Attributes)

  print_algo algo
  puts
  puts "Press enter to step through each example, Ctrl+D to continue to end"

  Assignment::Data::Examples.send(*(number ? [:first, number] : [:each])).each do |kase, example|
    gets # Pause before each example

    prior = colourise_classification algo.classify example

    if kase == correct_case
      algo.add_positive_example example
      example_colour = :light_green
    else
      algo.add_negative_example example
      example_colour = :light_red
    end

    after = colourise_classification algo.classify example

    puts "Example:" + " #{ example.inspect } ==> #{ kase }".send(example_colour)
    puts "Prior Classification:" + " #{ prior }"
    puts "After Classification:" + " #{ after }"
    puts "----"
    print_algo algo
  end
end

run
