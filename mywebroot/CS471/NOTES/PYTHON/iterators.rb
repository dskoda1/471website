#!/usr/bin/ruby
# sample iterator code in Ruby

module IteratorEx
	def iteratorB()  #() are note required.
		yield 3
		yield 4
	end

	def iteratorC()
		yield 11
		yield 22
		yield 33
	end
    
	def iteratorA(i)
		yield i*10
	end
	def nestedLoop()
		iteratorC() {|i| iteratorA(i) do |x|
						iteratorB() do |y|
							print x , ', ', y ,"\n"
						end
					end
				   }
	end
	def fibLazy(upto)
		fb1 = 1 #fn-2
		fb2 = 1 #fn-1
		oldfb1 =0
		while fb1 <= upto 
			(fb2,fb1,oldfb1) = fb1+fb2, fb2, fb1
			yield oldfb1
		end
	end
	
end

include IteratorEx

iteratorB{|i| print i; print "\n"}

iteratorB(){|i| print i; print "\n"}

iteratorC(){|i| print i; print "\n"}

nestedLoop(){|i| put "Nested Loop"}

fibLazy(100) {|fib|  puts fib}

# Scripts illustrating numbers are objects not primitives

sum = 0
1.upto(10){|n| sum = sum +n}
puts sum

puts "LIST"
lst = [ ]
0.upto(10){|n| lst[n]=n}
print lst
print "\n"


