# A binary tree class.  Feb. 26, 2006
class Tree:
    # The constructor for a tree
    def __init__(self, label, left=None, right=None):
        print "init " + repr(label)
        self.label = label
        self.left = left
        self.right = right
    # Converting Tree to a string    
    def __repr__(self, level=0, indent="    "):
        s = level*indent + repr(self.label)
        if self.left:
            s = s+"\n" + self.left.__repr__(level+1, indent)
       
        if self.right:
            s = s + "\n" + self.right.__repr__(level+1, indent)
        return s
    # How to iterator for the Tree
    def __iter__(self):
        def iter(t):
            if t:
                for x in iter(t.left):
                    yield x
                yield t.label
                for x in iter(t.right):
                    yield x
        return iter(self)
# 1) Define a method preorder()  that returns a preorder iterator of the tree
# 2) Define a method postorder() that returns a postorder iterator of the tree

# "run UsingTrees"
# >>> tr = TreeModule.treeFactory("abcde")
# >>> treeIterPrint(tr)
# a b c d e
# >>> treeIterPrint(tr.postorder())
# a b d e c
# >>> treeIterPrint(tr.preorder())
# c b a e d

    def preorder(self):
        def foo(t):
            if t:
                yield t.label
                for x in foo(t.left):
                    yield x
                for x in foo(t.right):
                    yield x
        return foo(self)



    def postorder(self):
        def foo(t):
            if t:
                for x in foo(t.left):
                    yield x
                for x in foo(t.right):
                    yield x
                yield t.label
        return foo(self)


    
    #End of Class Tree
    
#module functions   
def treeFactory(list):
    n = len(list)
    if n == 0:
        return []
    i = n / 2
    return Tree(list[i], treeFactory(list[:i]), treeFactory(list[i+1:]))

def printTreeIndented(tree, level=0):
  if tree == None : return
  printTreeIndented(tree.right, level+1)
  print '  '*level + str(level)
  printTreeIndented(tree.left, level+1)
