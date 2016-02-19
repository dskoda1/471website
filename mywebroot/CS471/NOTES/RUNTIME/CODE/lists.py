#!/usr/bin/env python3

# From "http://docs.python.org/py3k/glossary.html#term-list"
# list: A built-in Python sequence. Despite its name it is more akin to an array in
#       other languages than to a linked list since access to elements are O(1).

# List operations and examples
nLst = [1,2,3]
# Create an alias
aliasLst = nLst



# Create a copy
copyLst = nLst[:]
nLst[1] = 'wow'

print("nLst, aliasLst and copyLst \n", nLst,', ', aliasLst, ', ',copyLst)

# Create a list of characters from a string.
aLst = list(' abcdef ')
print("Length of the List =",len(aLst))
print("aLst =",aLst)


#Slicing --
chars = aLst[-6:-3]
print("\nchars a slice of aLst: ",  chars )
print("\nBeginning: ", aLst[0:-3])

# Lists with lists as item -- notice it the copies the reference.
yLst = [1,2,3]
xLst = [1,yLst,aLst]
print("\nxLst                   ", xLst)
yLst = 99
print("\nxLst after yLst change ", xLst)



# Adding Elements to a List

# append : appends a single object to a list
aLst.append(':')
print("\naLst after appending     ",aLst)

# What Happens if we append a List?
aLst.append(copyLst)
print("\naLst after appending nLst ",aLst)

# extends concatenates lists
vowels=list("aeiouy")
aLst.extend(vowels)
print("\naLst after extending      ",aLst)

# insert adds elements at a location in a list
aLst.insert(3, "dog")
print("\naLst after inserting 'dog' ",aLst)


