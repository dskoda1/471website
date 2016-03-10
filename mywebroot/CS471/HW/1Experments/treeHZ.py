# A binary tree class.
class Tree:

    def __init__(self, label, left=None, right=None):
        self.label = label
        self.left = left
        self.right = right
        
    def __repr__(self, level=0, indent="    "):
        s = level*indent + `self.label`
        if self.left:
            s = s + "\n" + self.left.__repr__(level+1, indent)
        if self.right:
            s = s + "\n" + self.right.__repr__(level+1, indent)
        return s

    def __iter__(self):
        return inorder(self)

    # Create a Tree from a list.
    def tree(list):
        n = len(list)
        if n == 0:
            return []
        i = n / 2
        return Tree(list[i], tree(list[:i]), tree(list[i+1:]))

    # A recursive generator that generates Tree labels in in-order.
    def inorder(t):
        if t:
            for x in inorder(t.left):
                yield x
            yield t.label
            for x in inorder(t.right):
                yield x

# Show it off: create a tree.
#t = tree("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
t = tree(("1","2","3","4","5","6","7","8","9","10","11"))
# Print the nodes of the tree in in-order.
#for x in t:
#    print x,
#print

# A non-recursive generator.
def inorder(node):
    stack = []
    while node:
        while node.left:
            stack.append(node)
            node = node.left
        yield node.label
        while not node.right:
            try:
                node = stack.pop()
            except IndexError:
                return
            yield node.label
        node = node.right

# Exercise the non-recursive generator.
#for x in t:
#    print x,
#print

#print t
# Create a Tree with n number of nodes.
def create_tree(n1, n2):
    if n2 - n1 == 0:
        return []
    middle = (n1 + n2) / 2
    return Tree(middle + 1, create_tree(n1, middle), create_tree(middle + 1, n2))


#newtree = create_tree(1,20)
#print "The new tree is:\n", newtree


# generate all distict trees for n nodes:
def treeGenerator(m,n):
    #newT = Tree(n)
    if n < m:
        yield None
    else:
        for i in range(m,n+1):
#            print "i is:", i, "n is:", n
            newT = Tree("*")
            for left in treeGenerator(m, i - 1):
                newT.left = left
 #               print "leftSub:\n", left, "_____"
                #print "in left i is:", i, "n is:", n, "\n"
                for  right in treeGenerator(i + 1,n):
                    newT.right = right
  #                  print "rightSub:\n", right, "_____"
                    yield newT



def printTreeIndented(tree, level=0) :
  if tree == None : return
  printTreeIndented(tree.right, level+1)
  print '  '*level + str(level)
  printTreeIndented(tree.left, level+1) 

i=0
for t in  treeGenerator(1,3):
    i += 1
    print "Tree:", i
    printTreeIndented(t)
    print

    

