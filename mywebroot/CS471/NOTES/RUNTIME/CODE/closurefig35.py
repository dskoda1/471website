# Nested Functions

def A():
    print ('Start:\nA()')
    a="var a \n"
    
    def B():
        print (" B()")
        b="  var b\n"
        
        def C():
            print ("  C()")
            c="    var c\n"
            print (a,b,c)
            #end of C
            
        def D():
            print ("  D()")
            d="    var d\n"
            print (a,b,d)
            #end of D
            
        print( a,b)
        D()
        C()
        #end of B
        
    def E():
        print (" E()")
        e="  var e\n"
        print (a,e)
        B()
        #end of E     
    E()
    
    return "end"

#end of A



# -----------------

# >>> A()
#Start:
#A()
# E()
#var a 
#   var e

# B()
#var a 
#   var b

#  D()
#var a 
#   var b
#     var d

#  C()
#var a 
#   var b
#     var c

#'end'




