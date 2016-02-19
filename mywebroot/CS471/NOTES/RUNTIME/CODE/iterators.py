#!/usr/bin/env python3
"""
generators --  http://www.python.org/dev/peps/pep-0342/
 Coroutines are a natural way of expressing many algorithms, such as
   simulations, games, asynchronous I/O, and other forms of event-
   driven programming or co-operative multitasking.  Python's iterable
   functions are almost coroutines -- but not quite -- in that they
   allow pausing execution to produce a value, but do not provide for
   values or exceptions to be passed in when execution resumes.  They
   also do not allow execution to be paused within the "try" portion of
   try/finally blocks, and therefore make it difficult for an aborted
   coroutine to clean up after itself.
"""

def generatorB():
    yield 3
    yield 4


# >>> f = generatorC()
# >>> f.next()      --for python 2
# >>> f.__next__()  --for python 3
# >>> next(f)       --for python 3 and 2.6 or later

def generatorC():
    yield 11
    yield 22
    yield 33
    
def generatorA(iterable):
    for i in iterable:
        yield i*10
    

#>>>  loop( generatorA() )

def loop(iterable):
    for i in iterable:
        print(i)

        
def nestedLoop():
    for x in generatorA(generatorC()):
        for y in generatorB():
            print(x , ', ', y)

#>>> it = generatorA(generatorC())
#>>> sumIter(it)
            
def sumIter(iterable):
    total = 0
    for i in iterable:
        print(i)
        total += i
    print("Sum is " + total)


def fibLazy():
    fb1 = 0 #fn-2
    fb2 = 1 #fn-1
    while True:
        yield fb1
        (fb1,fb2) = (fb2,fb1+fb2)
        
        
def printFibLazy(fv):
    for i in fibLazy():
        if i > fv: break
        print(i)
 
    
def fibEager (n):
     fb1 = 0
     fb2 = 1
     s = 0
     while s < n:
         s += 1
         (fb1,fb2) = (fb2,fb1+fb2)
     return fb1
    

class fibnum:
    """ Using objects created from a user defined class to generate values
    Modified example by
           Norman Matloff, University of California, Davis
    http://heather.cs.ucdavis.edu/~matloff/Python/PyIterGen.pdf
    """
    def __init__(self):
        self.fn2 = 1 # "f_{n-2}"
        self.fn1 = 1 # "f_{n-1}"
        print(self.fn2)
    def __next__(self):
        """next() is the heart of any iterator OBJECT 
        note the use of the following tuple to not only save lines of
        code but also to insure that only the old values of self.fn1 and
        self.fn2 are used in assigning the new values
        """
        (self.fn1,self.fn2,oldfn2) = (self.fn1+self.fn2,self.fn1,self.fn2)
        return oldfn2
    def __iter__(self):
        return self


def test():
    """Using a fibnum Object and "implicit" next"""
    fibseq = fibnum()
    for f in fibseq:
        print( f, ",")
        if f > 20:
            print("end of for loop")
            break
 
    next(fibseq)
    for (i, f) in zip(range(10), fibLazy()):
        print(i, "=", f)

    # http://linuxgazette.net/100/pramode.html

if __name__ == '__main__':
    test()
