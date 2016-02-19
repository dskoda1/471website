#!/usr/bin/ruby
# Letters.rb
# http://www.ruby-lang.org/en/documentation/quickstart/
#  Ruby modules 
#     -use to group code together by topic
#     -use as "mixins" 
#           (http://www.juixe.com/techknow/index.php/2006/06/15/mixins-in-ruby/)
#     http://rubylearning.com/satishtalim/ruby_regular_expressions.html
#     http://www.rubular.com/  (interactive regular expression tester)
#     http://networking.ringofsaturn.com/Web/regex.php

# I/O formating like C.-- sprintf
# <string>.to_i converts (casts) a string to an int
#<string>.to_f converts (casts) a string to a float
# <int>.to_s  converts (casts) a int to a string
#
module Letter
  TEMPLATE1 = "Dear :::customer:::,\n"
  TEMPLATE2 = "Please pay us :::amount::: now.\n Accounts Payable\n\n" 
  
#If you use ' then \n is not evaluated
  
	def my_letter(list)
                 #Regular expression object & literal
		customer_re = /([a-zA-Z]+)\s*([a-zA-Z]+)\s*([0-9]+)/  
		letters = ""
		customer_list = ""
		short_list =""
		list.each do
			|customer_info|
			c = customer_re.match(customer_info) 
			#adds if non-empty string
			customer_list= customer_list + "\nc.string"+ c[0]  + "\n" unless c.string =~ /$^/ 
  
			short_list= short_list+ "Last name:"+ c[2] +"\n" unless c[1] =~ /$^/ 
			#one way to create a letter 
			temp = TEMPLATE1.gsub( /:::customer:::/ ) { c[1] } 
			temp = temp + TEMPLATE2  
			temp.gsub!( /:::amount:::/ ) { sprintf( "$%0.2f",c[3]) } 
			     # ! causes "temp" string to mutate
				 # sprintf -- formats to a string buffer
			letters = letters + temp
         # just to see what is going on you can -- print c[1]+","  
		end #29
      
      #Write letters to a file
      outFile = File.new("Letter",'w')
      outFile.puts(letters)
      outFile.close
		return  letters, short_list  #multiway 
	end #23

	def get_list(filename)
		return File.open(filename, 'r').readlines
	end #52
	
end #17

include Letter
# IN IRB you can execute this program...

# load "Letter.rb"
# (letter,lst)= my_letter(get_list('customers'))
# print "letter--\n"
# print letter 
# print " "
# print  "lst \n "
# print lst

