#Feb 26,2006
import TreeModule

# Create some trees using the function in TreeModule
t1 = TreeModule.treeFactory("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
t2 = TreeModule.treeFactory(("1","2","3","4","5","6","7","8","9","10","11"))

# Flat printout of the nodes of the tree based on an iterator.
def treeIterPrint(t):
    for x in t:
        print x,
    print

# pretty print a collection of trees
def prettyPrint(trees):
    i=0
    for t in trees:
        i += 1
        print "Tree:", i
        TreeModule.printTreeIndented(t)
        print

# Challenge: 1) Create a trees with n nodes using recursion:
#            2) Generate all possible trees with n nodes using Python Generators:




# Create a Tree with n number of nodes.
def create_rec(n1, n2):
    if n2 - n1 == 0:
        return []
    middle = (n1 + n2) / 2
    return TreeModule.Tree(middle + 1, create_rec(n1, middle),
                           create_rec(middle + 1, n2))
# >>> create_rec(1,5)
# 4
#    3
#        2
#    5
# >>> r=create_rec(1,5)
# >>> r
# 4
#    3
#       2
#    5
#

# generate all distinct trees for n nodes:
# Ours labels the depth of each node.

def treeGenerator(m,n):
    if n < m:
        yield None
    else:
        for i in range(m,n+1):
            newT = TreeModule.Tree(i)
            for left in treeGenerator(m, i - 1):
                newT.left = left
                for  right in treeGenerator(i + 1,n):
                    newT.right = right
                    yield newT



def treeFGen(size,label):
# Finkel's algorithm...  
    if size <= 0:
        yield None
    else:
        for level in range( 1, size+1):
            answer = TreeModule.Tree(label)
            for left in treeFGen(level-1," left  "):
                answer.left = left
                for right in treeFGen(size-level," right "):
                    answer.right = right
                    yield answer


def treeFGenerator(size):
# Finkel's algorithm...  
    if size <= 0:
        yield None
    else:
        for root in range( 1, size+1):
            answer = TreeModule.Tree(root)
            for left in treeFGenerator(root-1):
                answer.left = left
                for right in treeFGenerator(size-root):
                    answer.right = right
                    yield answer



# trs = treeFGen(3,"root")
# for t in trs:
#    print 
#    t 
        
# trs = treeFGenerator(3)
#prettyPrint(trs)


# >>> trees = treeGenerator(1,3)
# >>> prettyPrint(trees)

    
#Tree: 1
#    2
#  1
#0
#
#Tree: 2
#  1
#    2
#0

#Tree: 3
#  1
#0
#  1

#Tree: 4
#0
#    2
#  1

#Tree: 5
#0
#  1
#    2
