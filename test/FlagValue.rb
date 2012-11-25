#! /usr/bin/env ruby 

require 'Q'
include Q

flags = FlagValue.new(0)
puts flags.test()
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
