#!/usr/bin/ruby
# sample iterator code in Ruby

# "A Ruby iterator is simply a method that can invoke a block of code. 
# At first sight, a block in Ruby looks just like a block in C, Java, or Perl. 
# Unfortunately, in this case looks are deceiving---a Ruby block is a way of 
# grouping statements, but not in the conventional way."
# From:    http://ruby-doc.org/docs/ProgrammingRuby/html/tut_containers.html

module IteratorEx
	def generateB()  #() are note required.
		yield 3
		yield 4
	end

	def generateC()
		yield 11
		yield 22
		yield 33
	end
    
	def generateA(i)
		yield i*10
	end
	
	def nestedLoop()
		generateC() {|i| generateA(i)  {|x| 
			generateB() {|y|   
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
class NumericSequences
	def pascal_triangle_row(n) 
		for k in 0..n
			yield(fact(n)/(fact(k)*fact(n-k)))
		end
	end
	def fact(n)
		if (n<2) 
			return 1
		else
			return n* fact(n-1)
		end
	end
	def pascal(limit_row)
		i = 0
		while (i <= limit_row) 
			pascal_triangle_row(i){|x| yield(x)}
			i = i+1
		end 
	end
end

include IteratorEx

generateB{|i| print i; print "\n"}

generateB(){|i| print i; print "\n"}

generateC(){|i| print i; print "\n"}

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

g = NumericSequences::new
(0..8).each {|n| g.pascal_triangle_row(n) {|r| print "#{r} "}; print "\n"}
