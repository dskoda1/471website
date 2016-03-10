#!/usr/bin/ruby
# sample ruby code
class Test
	# creates a text files, 
	
	#     Names.txt contains the strings that match the $2 group and is the name of a function.
	  
	Names = File.new("Names.txt","w")
	
	# initialize is the constructor
   def initialize(pattern, description, output_file)
	   @pattern = pat  #instance varable
	   @description = descr
	   @output_file = output_file
	   

   end
   
   def read_and_parse_from input_file
    File.open @output_file, 'w' do |output|
      output.puts "#(@descr) in File:: #{input_file} \n  Pattern::#{@pattern.inspect}"
      File.open input_file do |input|
        input.each do |line|
        	# puts line
			# match are the groups matched by "pattern"
          if match = @pattern.match(line)
            output.puts match[2]
          end
        end
      end
    end
  end
   
   
"   def wrtFile(filename) 
	   Names.print("#(@descr) in File:: #{filename} \n  Pattern:: #{@pat}\n\n" )
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
		"
end

#marshall

Test.new(/(int)\s(.*)\(.*\);/, "output.txt").read_and_parse_from "input.c"


# Create an object which uses a user supplied RE and creates Name.txt file
# \s 	space (0x20), ")" is a meta character, "\)" will match the character ")", "."&"*" are meta character

ex = Test.new( /(int)\s(.*)\(.*\)\s/ , "Names of functions" )

# read input file and write to the output files
ex.wrtFile("Fig4_12.c")


# Method for homework .. converts binary strings, octal strings and hex strings to decimal representation.

puts (Integer ("0b0101"))
puts (Integer (0x01A))

# useful link
#http://www.techotopia.com/index.php/Ruby_Number_Classes_and_Conversions#Convert_a_Hexadecimal_Number_to_an_Integer
