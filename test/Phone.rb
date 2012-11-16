#! /usr/bin/env ruby 

require 'optparse'
require 'Q'
include Q

number = '+491776660099'

optparse = OptionParser.new do |opts|
  # topline banner for help
  opts.banner = Console.txHead('Testscript for DataCore::Phone class')
  opts.on('-n', '--number NUM', 'set number to test') do |num|
    number = num
  end

  opts.on('-?', '--help', 'Display this screen') do
    puts opts
    exit
  end  
end

optparse.parse!

fone = Phone.new(number)
puts fone
puts fone.inspect
