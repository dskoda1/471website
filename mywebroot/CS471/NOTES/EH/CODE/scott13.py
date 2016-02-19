# Modification of Scott's (2ed) figure 13.22  page 725

i = 1 
j = 3

def outer():
    print  "BEGIN outer()"
    print j   #what if I tried to print i    
    def middle(k):
        var = 10
        #  what value of i? k =5 ??
        def inner():
            global i
            i = 4       
            return   # NOT NEEDED since no values are turned.
        inner()
        return i, j, k
    
    i = 2  # what if i is defined after call to middle()?
    var = 1000
    middle(j)
  
    print var, i,j
    return middle(j) # the return results will be printed


# OUTPUT after running outer()
   
# BEGIN outer() <<<   print  "BEGIN outer()"
  
# 3 <<<  print j   #??? i  
# 1000 2 3  <<< print var, i,j
# (2, 3, 3)  <<< return value of middle(j)
