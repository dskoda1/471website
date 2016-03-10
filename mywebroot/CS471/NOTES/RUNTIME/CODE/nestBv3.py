def A(argA):
    a = argA + 2
    print("  Begin A(), argA: ",argA, "  a:", a)    

    
    def B( argB ):
        print("      Begin B(), b = ", argB)
        #end of B
        def C( argC ):
            print("        Begin C()--argC =", argC )
            print("        a: ", a, "  argB: ", argB )
            return  a + argB + argC
            #end of C
        return C  # end of B -- B returns function C


    print( "  END of A -- argA:", argA)
    return B(5)  # end of A -- A returns a function C


        
def E():
    print(" Begin E() " )
    Fun = A(11)
    print("   Fun = A(11)", Fun)
    x = Fun(7)
    print("   x  = Fun(7):  ", x )
    x = Fun(2000)
    print("   x  =  Fun(2000): ", x )
    print (" END of E")
    return 
     #end of E

