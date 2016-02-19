#!/usr/bin/env ruby
# sample iterator code in Ruby

# "A Ruby iterator is simply a method that can invoke a block of code. 
# At first sight, a block in Ruby looks just like a block in C, Java, or Perl. 
# Unfortunately, in this case looks are deceiving---a Ruby block is a way of 
# grouping statements, but not in the conventional way."
# From:    http://ruby-doc.org/docs/ProgrammingRuby/html/tut_containers.html

# modules in Ruby allow Mixins.

module IteratorEx
	def generatorB()  #() are note required.
		yield 3
		yield 4
	end

	def generatorC()
		yield 11
		yield 22
		yield 33
	end
    
	def generatorA(i)
		yield i*10
	end
	
	def nestedLoop()
		generatorC() {|i| generatorA(i)  {|x| 
			generatorB() {|y|   
			    print x , ', ', y ,"\n" }
			}  }
	end

	def fibLazy(upto)
		fb1 = 0 #fn-2
		fb2 = 1 #fn-1
		while fb1 <= upto 
			yield fb1
			(fb2,fb1) = fb1+fb2, fb2 
		end
	end
	
end

include IteratorEx

generatorB{|i| print i; print "\n"}

generatorB(){|i| print i; print "\n"}

generatorC(){|i| print i; print "\n"}

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
puts lst


