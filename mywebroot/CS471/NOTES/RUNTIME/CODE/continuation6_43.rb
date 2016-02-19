#!/usr/bin/env ruby
# Continuation ex. 644
# From Scott's 4th edition

require "continuation"

 def here
	return callcc { |h| puts "\n --here's value is: "; puts h; return h }
 end
	
 def bar(i)
	printf "   *Start %d; ", i
	c = if i < 3 then bar(i+1) else here end
	# Also works with c = if i < 3 then bar(i+1) else here() end
	printf "   *End %d; ", i
	## puts c

	return c
 end
 n = 3
 r = bar(1)

 puts "\n ---r's value is: "; puts r
 n -= 1
 printf "\nCurrent value of n %d; \n", n
 if n >= 1 then r.call(r) end
 puts "done"

=begin  *** Results of running code ***
irb(main):030:0> load "continuation6_43.rb"
   *Start 1;    *Start 2;    *Start 3; 
 --here's value is: 
#<Continuation:0x00000001ae73f0>
   *End 3;    *End 2;    *End 1; 
 ---r's value is: 
#<Continuation:0x00000001ae73f0>

Current value of n 2; 
   *End 3;    *End 2;    *End 1; 
 ---r's value is: 
#<Continuation:0x00000001ae73f0>

Current value of n 1; 
   *End 3;    *End 2;    *End 1; 
 ---r's value is: 
#<Continuation:0x00000001ae73f0>

Current value of n 0; 
done
=> true
irb(main):031:0> 
=end


=begin
# Note that if returns the last value.
irb(main):036:0> x =1
=> 1
irb(main):037:0> y = if x >10 then 99 else 100 end
=> 100
=end

