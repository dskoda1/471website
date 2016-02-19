def A(var):
    print(" Begin A()")
    a=5
    
    def B( v ):
        print(" Begin B() ---", var+v)
        return var + v + a
        #end of B  

    def E(Fun,a):
        print(" Begin E()")
        print("   E(Fun)-- a ", Fun(a),a )
    #end of E
    
    print("call E ", E(B,2))
    print("call E ", E(B,11))
    return              



    
    
        
