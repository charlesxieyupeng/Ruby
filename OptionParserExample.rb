require 'optparse'

options = {}

parser = OptionParser.new do|opts|
  opts.banner = "Usage: years.rb [options]"
    #Short cut version of on() method
    opts.on('-n=name') do |name|
    options[:name] = name
  end

  opts.on('-a', '--age age', 'Age') do |age|
    options[:age] = age
   end

  opts.on('-h', '--help', 'Displays Help') do
    puts opts
    exit
  end
end

parser.parse!

# Another type: 
#
# OptionParser.new do|opts|
#   ...
# end.parse!

if options[:name] == nil
  print 'Enter Name: '
  options[:name] = gets.chomp
end

if options[:age] == nil
  print 'Enter Age: '
  options[:age] = gets.chomp
end

sayHello = 'Hello ' + options[:name] + ', '

if Integer(options[:age]) == 100				
  sayAge = 'You are already 100 years old!'
elsif Integer(options[:age]) < 100
  sayAge = 'You will be 100 in ' + String(100 - Integer(options[:age])) + ' years!'
else
  sayAge = 'You turned 100 ' + String(Integer(options[:age]) - 100) + ' years ago!'
end

puts sayHello + sayAge

#command: ruby OptionParserExample.rb -n Joe --age 25
#output: Hello Joe, You will be 100 in 75 years!
# http://www.dreamsyssoft.com/ruby-scripting-tutorial/optionparser-tutorial.php