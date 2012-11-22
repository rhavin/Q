#! /usr/bin/env ruby 

require 'Q'
include Q

# flags = Q::FlagValue.new(0)

class A
  # we define two R/W attributes with accessors
  attr_accessor :acc, :bcc

  # we define two attributes with getter/setter-functions
  def dirA=(d); @dirA=d; end
  def dirA; @dirA; end
  def dirB=(d); @dirB=d; end
  def dirB; @dirB; end
end

varA = A.new




startT = Time.now.to_f
dirT = 0
accT = 0
sigT = 0

# now we do 100 times the same benchmarking
# where we do the same assignment operation
# 50000 times
100.times do
  startT = Time.now.to_f
  50000.times do |i|
    varA.dirA = i
    varA.dirB = varA.dirA
  end
  dirT += (Time.now.to_f - startT)

  startT = Time.now.to_f
  50000.times do |i|
    varA.acc = i
    varA.bcc = varA.acc
  end
  accT += (Time.now.to_f - startT)


end

puts "direct:   %10.4fs" % (dirT/100)
puts "accessor: %10.4fs" % (accT/100)

# flags |= 6
# flags &= ~2
#flags.add(2)
#flags.add(4)
#flags sub(2)
# puts flags
# puts flags.test(4)
# puts flags.test(2)
# puts '---'
# puts flags.inspect
# puts flags.to_s
