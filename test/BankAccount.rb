#! /usr/bin/env ruby 

require 'optparse'
require 'Q'
include Q

# we define initial test parameters
holder    = 'Heinz-Achmed Gruenberg'
institute = 'Trustful, Inc.' 
blz       = '10020030'
knr       = '012345678'
iban      = 'DE68 2105 0170 0012 3456 78'
bic       = 'MARKDEFFXXX'
mode      = BankAccount::MODE_KNRBLZ


optparse = OptionParser.new do |opts|
  # topline banner for help
  opts.banner = Console.txHead('Testscript for Q::Bank_Account class')

  opts.on('-n', '--name HOLDER', 'set name to HOLDER') do |str|
    holder = str
  end

  opts.on('-i', '--institute=IN', 'set institute to IN') do |str|
    institute = str
  end

  opts.on('-m', '--init [MODE]', Integer, 'initialize with mode MODE') do |num|
    mode = num
  end

  opts.on('--blz BLZ', 'set blz to BLZ') do |num|
    blz = num
  end

  opts.on('--knr KNR', 'set knr to KNR') do |num|
    knr = num
  end

  opts.on('--bic BIC', 'set bic to BIC') do |num|
    bic = num
  end

  opts.on('-?', '--help', 'Display this screen') do
    puts opts
    exit
  end  
end

optparse.parse!

case mode
  when BankAccount::MODE_KNRBLZ
    account = BankAccount.new(mode, blz, knr, holder, institute)
  else
    account = BankAccount.new(mode, iban, bic, holder, institute)
end

puts account
puts account.inspect
