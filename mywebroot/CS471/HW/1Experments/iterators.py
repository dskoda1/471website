def iteratorB():
    yield 3
    yield 4


# f = iteratorC() --- f.next()
def iteratorC():
    yield 1
    yield 2
    yield 3
def iteratorA(iter):
    for i in iter:
        yield i*10
    

#call loop( iteratorA() )
def loop(iter):
    for i in iter:
        print repr(i)

        
def nestedLoop():
    for x in iteratorA(iteratorC()):
        for y in iteratorB():
            print repr(x)
            print repr(y)

def fibs():
    fb1 = 1 #fn-2
    fb2 = 1 #fn-1
    while True:
        (fb1,fb2,oldfb2) = (fb1+fb2, fb1, fb2)
        yield oldfb2
