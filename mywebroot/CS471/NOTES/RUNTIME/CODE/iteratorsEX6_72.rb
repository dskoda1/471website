#!/usr/bin/env ruby
# sample iterator code in Ruby
# From Scott's 4th edition


def uptoby(first, last, inc)
	while first <= last do
		yield first
		first += inc
	end
end

sum = 0
uptoby(1, 100, 2)  { |i| sum += i }
puts sum

# uptoby is syntactic sugar for uptobyF
# Ruby passes the closure representing the block (a "proc") 
#                            as an implicit extra argument to the function

def uptobyF(first, last, inc, &block)
	while first <= last do
		block.call(first)
		first += inc
	end
end

sumF = 0
uptobyF( 1, 100, 2, &Proc.new{ |i| sumF += i } )
puts sumF

# All Ruby collection objects suppport a method named "each" 
# which will invoke a block for every element of the collection.
# See treeModule.rb in notes.

sum = 0
(1..100).each { |i| sum += i }
puts sum
