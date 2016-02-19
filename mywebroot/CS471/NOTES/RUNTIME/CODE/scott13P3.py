# Modification of Scott's (2ed) figure 13.22  page 725
i = 1 
j = 3
out = 55

def outer():
    out = 100
    print  ("BEGIN outer()\n  out, j -->", out, j)
    #What if I tried to print i??
 
    def middle(k):
        # Which i? k =5 ??
        
        def inner():
            nonlocal out # Which out??
            global i     # Which i??
            i = 4
            out = 999
            return   # NOT NEEDED
        
        print("middle() before inner()\n  out, i, j, k -->", out,i,j,k)
        # Which out, i?
        inner()
        print("return in middle()\n  i, j, k -->", i,j,k)
        return i, j, k
    
    i = 2  # what if i is defined after call to middle()?
    middle(j)
    print("In outer() after middle() \n  out, i, j -->", out, i, j)
    return middle(j)
    # the return results will be printed





######################################################################

#BEGIN outer()
#  out, j --> 100 3
#middle() before inner()
#  out, i, j, k --> 100 2 3 3
#return in middle()
#  i, j, k --> 2 3 3
#In outer() after middle() 
#  out, i, j --> 999 2 3
#middle() before inner()
#  out, i, j, k --> 999 2 3 3
#return in middle()
#  i, j, k --> 2 3 3
#(2, 3, 3)
