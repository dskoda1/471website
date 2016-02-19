# generators --  also called co-routines

def iteratorB():
    yield 3
    yield 4


# >>> f = iteratorC()
# >>> f.next()

def iteratorC():
    yield 11
    yield 22
    yield 33
    
def iteratorA(iter):
    for i in iter:
        yield i*10
    

#>>>  loop( iteratorA() )

def loop(iter):
    for i in iter:
        print repr(i)

        
def nestedLoop():
    for x in iteratorA(iteratorC()):
        for y in iteratorB():
            print repr(x) , ', ', repr(y)

#>>> it = iteratorA(iteratorC())
#>>> sumIter(it)
            
def sumIter(iter):
    sum = 0
    for i in iter:
        print repr(i)
        sum = sum + i
    print "Sum is " + repr(sum)


def fibLazy():
    fb1 = 1 #fn-2
    fb2 = 1 #fn-1
    while True:
        (fb2,fb1,oldfb1) = (fb1+fb2, fb2, fb1)
        yield oldfb1
        
def printFibLazy(fv):
    for i in fibLazy():
        if i > fv: break
        print repr(i)
 
    
def fibEager (n):
     fb1 = 1
     fb2 = 1
     s = 0
     while s < n:
         s += 1
         (fb2,fb1,oldfb1) = (fb1+fb2, fb2, fb1)
     return oldfb1
