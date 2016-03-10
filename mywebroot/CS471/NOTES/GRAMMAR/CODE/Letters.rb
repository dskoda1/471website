#!/usr/bin/ruby
# Letters.rb
# http://www.ruby-lang.org/en/documentation/quickstart/
#  Ruby modules 
#       use to group code together by topic
#       use as "mixins" 
#          (http://www.juixe.com/techknow/index.php/2006/06/15/mixins-in-ruby/)
#     http://rubylearning.com/satishtalim/ruby_regular_expressions.html
#     http://www.rubular.com/  (interactive regular expression tester)
#     http://networking.ringofsaturn.com/Web/regex.php
# I/O formating like C.-- sprintf to format a string buffer

module Letter
  TEMPLATE =
   "Dear :::customer:::,\nPlease pay us :::amount::: now.\n Accounts Payable\n\n" 
         #If you use ' then \n is not evaluated
  
	def my_letter(list)
		customer_re = /([a-zA-Z]+)\s*([a-zA-Z]+)\s*([0-9]+)/ 
                      #Regular expression object & literal
		letters = ""
		customer_list = ""
		short_list =""
		list.each do
			|customer_info|
			c = customer_re.match(customer_info) 
			customer_list= customer_list + "\nc.string"+ c[0]  + "\n" unless c.string =~ /$^/ 
			short_list= short_list+ "Last name:"+ c[2] +"\n" unless c[1] =~ /$^/
                           
			temp = TEMPLATE.gsub( /:::customer:::/ ) { c[1] } 
                           #one way to create a letter 
			temp.gsub!( /:::amount:::/ ) { sprintf( "$%0.2f",c[3]) } 
			     # ! causes "temp" string to mutate
			letters = letters + temp
			print c[1]+"\n"  
		end # 24
		return  letters, short_list  #multiway 
	end #18
	
	def get_list(filename)
		return File.open(filename, 'r').readlines
	end #40
end #13

include Letter

# (letter,lst)= my_letter(get_list('customers'))
# print "letter--\n"
# print letter 
# print " "
# print  "lst \n "
# print lst

