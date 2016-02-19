#!/usr/bin/ruby
# sample ruby code
module RubyD
	def fact(n)
		if n> 1
			return n* fact(n-1)
		else
			return 1
		end
	end



	def show_regEx (str, re)
	    if str =~ re
		 result = "#{$`}<<#{$&}>>#{$'}"
		 puts result
		 result
	    else
		 "NO MATCH"
	    end
	end
	


	def readFileRE(name)
		#Reads a file and matches lines with "def " and prints these lines out.
		print "   File is ", name,"\n"
		file=File.new(name,"r") 
		while line=file.gets
			fun=show_regEx(line, /def\s[a-z]*_/ ) #posix 
			if fun !~ %r{NO MATCH}  
				print "Result is ::", fun, "\n"
			end
		end
	end

end
# Running in shell output is:
#    ...> ruby rubyD.rb
#    
# Loading in irb tool output is:
#    irb...> load 'rubyD.rb'
#      ...
#    => true

# Using "go" in SciTE
#    >ruby rubyD.rb
#    ...
#   >Exit code: 0

# Using command line
#   > ruby fact.rb
#   ...
#   
include RubyD	
puts "fact(6) is ", fact(6),"\n" 
print "fact(6) is ", fact(6),"\n" 
puts 'Simple test of RE'
show_regEx('very interesting',/in/)
show_regEx('in an interesting',/tin/)
show_regEx("def prt_ex" , /def\s[a-z]*_/ ) 
show_regEx("def prt_ex" , /def\s[[:alpha:]]*_/ ) # posix class
puts " "
puts 'Test of File I/O and RE'
readFileRE("rubyD.rb")

