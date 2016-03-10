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
        
class CNode:
    left, right, data = None, None, 0
    def __init__(self,data):
        self.data = data
        self.left = None
        self.right = None
    def __repr__(self, level = 0, indent="    "):
        s = level*indent + 'self.data'
        if self.left:
            s = s + "\n" + self.left._repr_(level+1,indent)
        if self.right:
            s = s + "\n" + self.right._repr_(level+1,indent)
        return s
    

def treeGen(size):
    answer = CNode(size)
    print "gen tree "+ repr(size) 
    if size == 0 :
        yield None
    else:
        for root in range(1,size):
            print "root is "+ repr(root)
            for answer.left in treeGen(root-1):
                print "left is "+ repr(answer.left)
                for answer.right in treeGen(size-root):
                    print "right tree is "+ repr(answer.right)
                    yield answer

def prt(tree):
    if tree:
        print tree.__repr__(0)
       
def prtF(fibs):
    for f in fibs():
        print repr(f)
        yield f


#http://www.suttoncourtenay.org.uk/duncan/accu/pythonpatterns.html
class Node(object):
    def __init__(self, left, right):
        self.left = left
        self.right = right

    def __iter__(self):
        if (isinstance(self.left, Node)):
            for n in self.left:
                yield n
        else:
            yield self.left

        if (isinstance(self.right, Node)):
            for n in self.right:
                yield n
        else:
            yield self.right

import unittest
class NodeTests(unittest.TestCase):
    def testNode(self):
        tree = Node(
                  Node('a', 'b'),
                  Node(
                      Node('c', 'd'),
                      'e'))

        self.assertEquals(['a', 'b', 'c', 'd', 'e'], list(iter(tree)))

#if __name__=='__main__':
#    unittest.main()   

            
        
