#!/usr/bin/ruby
# Module example in RUBY 
#          -- makes a name space
#          -- can be used in Mix-ins
# Ruby is object oriented so we need to include the module

# To run using
#      IRB::
# ...> load 'fib.rb'
# ...> fib(8)

# To run using SciTE
# open text file in SciTE 
# To check syntax -- pull down "Tools" menu and select "Check Syntax"
# To execute code -- pull down "Tools" menu and select "Go" 
#    You will see in the frame on the right::
#        >ruby fib.rb
#        34
#        >Exit code: 0
#    There is no interactive testing in the frame.

module FibEx

	def fib (n)
	    if (n < 2) then
			return 1
	    else  
			return fib(n-1) + fib(n-2)
		end #End of "if/else"
	end #End of "function/method"
  
	def fibi (n) 
	    a = 1
	    b = 1
	    s = 1
	   while (s < n) 
			s += 1
			t = a + b
			a = b
			b = t
	   end #End while
		return b
	end #End of fibi

   
	def fibf (n)
	   a = 1
	   b = 1
	   for i in 2 .. n    # i assumes the values 2 to n
			t = a + b
			a = b
			b = t
		end #End of for
	    return b
    end #End of fibf
    
    def fibl(n)
		a = 1
		b = 1
		n.times do  # everything is an object, even n
			a, b = b, a+b
		end  # so n.times causes the do block to be executed n times.
		return a
	end  # so n.times causes the do block to be executed n times.
        
end #End of Module

# To use methods in IRB we need to include this module

include FibEx
puts fib(8)  # Prints out the result of fib(8) 
puts fibf(8)
puts fibl(8)

# now we can call any method in FibEx by it's simple name.