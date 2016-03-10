# Modification of Scott's (2ed) figure 13.22  page 725

i = 1 
j = 3

def outer():
    print  "BEGIN outer()"
    print j      ## can not print i here since it is redefined in outer
    def middle(k):
        var = 10
        print "Beginning -- i="
        print i  
        # can print i since it was defined in outer before the call
        
        def inner():
            global i
            i = 4
            str = "Inner(): var, i, j, k\n         "      
            print str, var, i,j,k 
            return   # NOT NEEDED since no values are turned.
        
        inner()      
        return i, j, k  # refers to middle's "i"
    
    i = 2    #local (outer) i covers global i if done after call problem
    var = 1000
    print "Call to middle(j)"
    middle(j)
    str= "After return from  middle(j) var, i, j \n                            "
    print str, var, i,j   # k is not defined here Not in Scope
    return middle(j) # the return results will be printed


# output   >>> outer()
#  BEGIN outer()  <<<<print  "BEGIN outer()"
#  3   <<<<    print j ## can not print i here since it is redefined in outer
#  Call to middle(j) <<<<    print "Call to middle(j)"
#  Beginning -- i=  <<<<         print "Beginning -- i="
#  2   <<<< print i
#  Inner(): var, i, j, k <<<< print str, var, i,j,k
#             10 4 3 3
#  After return from  middle(j) var, i, j <<< print str, var, i,j   # k is not defined here Not in Scope
#                               1000 2 3
# repeat for return middle(j)
  # Beginning -- i=
  # 2
  # Inner(): var, i, j, k
  #        10 4 3 3
# (2, 3, 3)  return value  >>> 
