def A():
    print "A()"
    a="A\n"
    
    def B():
        print "B()"
        b=" B\n"
        
        def C():
            print "C()"
            c="  C\n"
            print a,b,c
            #end of C
            
        def D():
            print "D()"
            d="  D\n"
            print a,b,d
            #end of D
            
        print a,b
        D()
        C()
        #end of B
        
    def E():
        print "E()"
        e=" E\n"
        print a,e
        #end of E
        
    E()
    B()
