#!/usr/bin/ruby
# sample iterator code in Ruby

module IteratorEx
	def iteratorB
		yield 3
		yield 4
	end

	def whereisit
		yield
		yield
		yield
	end
end
include IteratorEx
whereisit {puts "where is the money?"}
print "NEXT iterator\n"
iteratorB{|i| print i; print "\n"}

def MyIterator()
    p "Before First"
    yield "First"
    p "After First"

    3.times do |i|
        yield i.to_s
    end

    p "Before Last"
    yield "Last"
    p "After Last"
end

MyIterator do |s|
    p s
end 

def MyIterator2()
    p "Before First"
    yield "First"
    p "After First"

    3.times { |i| yield i.to_s }

    p "Before Last"
    yield "Last"
    p "After Last"
end

MyIterator2 { |s| p s } 

