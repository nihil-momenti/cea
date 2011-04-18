#!/usr/bin/env ruby

require './hacks/backports'

begin
  require './hacks/colorize'
rescue
  require './hacks/fallback'
end

require 'optparse'

require './lib/cea'
require './data'

# The main runner.
def run
  options = parse_args
  eval "@data_set = DataSets::#{options[:dataset]}"
  case options[:task]
  when :train
    train (options[:class] || @data_set::DefaultCase), options[:number], options[:pause]
  when :classify
    classify options[:number]
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

def parse_args
  options = {}

  OptionParser.new do |opts|
    opts.banner = "Usage: #{__FILE__} [options]"

    options[:task]    = :train
    options[:number]  = nil
    options[:class]   = nil
    options[:dataset] = 'Assignment'
    options[:pause]   = false

    opts.on '-t', '--task TASK', 'Which task to perform (train or classify), default = train' do |task|
      options[:task] = task.to_sym
      options[:number] = 10 if task == 'classify'
    end

    opts.on '-n', '--number NUMBER', 'How many examples to use, default = all for training, 10 for classifying' do |number|
      options[:number] = number.to_i
    end

    opts.on '-c', '--class CLASS', 'Which class to train on, only applicable for the training task' do |klass|
      options[:class] = klass.to_sym
    end

    opts.on '-d', '--dataset DATASET', 'Which dataset to use (Assignment or Balance)' do |dataset|
      options[:dataset] = dataset
    end

    opts.on '-p', '--pause', 'To pause between examples' do
      options[:pause] = true
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

def train correct_case, number, pause
  algo = CEA::Algorithm.new(@data_set::Attributes)

  print_algo algo
  puts
  puts "Press enter to step through each example#{ RUBY_VERSION < '1.8.7' ? '' : ', Ctrl+D to continue to end'}" if pause

  @data_set::Examples.send(*(number ? [:take, number] : [:+, []])).each do |kase, example|
    gets if pause

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

def classify number
  algos = Hash[
    @data_set::Cases.map do |key|
      [key, CEA::Algorithm.new(@data_set::Attributes)]
    end
  ]

  @data_set::Examples.take(number).each do |kase, example|
    algos.each do |key, algo|
      if kase == key
        algo.add_positive_example example
      else
        algo.add_negative_example example
      end
    end
  end

  algos.each do |key, algo|
    puts "For case: #{key}, Version space is:"
    print_algo algo
    puts "===="
  end

  @data_set::Examples.drop(number).each do |kase, example|
    puts "For Example: " + example.inspect.light_green
    puts "               => ".light_green + kase.to_s.light_green
    results = Hash[
      algos.map do |key, algo|
        classification = algo.classify example
        puts "#{key} (#{algo.convergent_state == :converged ? "conv".green : "unco".red}) classifies as: #{colourise_classification classification}"
        [key, classification]
      end
    ]
    if results.values.one? { |val| val == :positive }
      puts "Class: " + results.index(:positive).to_s.green
    elsif results.values.any? { |val| val == :unknown }
      puts "Class: " + "don't know".magenta
    elsif results.values.none? { |val| val == :positive }
      puts "Class: " + "not classified".magenta
    else
      puts "Class: " + "error".red
    end
    puts
  end
end

run
