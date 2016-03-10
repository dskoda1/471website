#!/usr/bin/ruby
# sample ruby code
class Test
	# creates a text files, 
	
	#     Names.txt contains the strings that match the $2 group and is the name of a function.
	  
	Names = File.new("Names.txt","w")
	
	# initialize is the constructor
   def initialize(pat)
	   @pat = pat  #instance varable

   end
   
   def wrtFile(filename) 
	   Names.print("Names of functions in File:: #{filename} \n  Pattern:: #{@pat}\n\n" )
	   IO.foreach(filename) { |line| 
			# puts line
			# Match operator =~ returns the index of the first match :: string =~ re OR re =~ str
			if line =~ @pat
				# $2    :: receives the "second" group
				Names.print(" #{$2}") 
				end
			}
			Names.close
		end
		
end

# Create an object which uses a user supplied RE and creates Name.txt file
# \s 	space (0x20), ")" is a meta character, "\)" will match the character ")", "."&"*" are meta character
ex = Test.new( /(int)\s(.*)\(.*\)\s/  )

# read input file and write to the output files
ex.wrtFile("Fig4_12.c")
