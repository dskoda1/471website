> module Hw11
>     where
     

Copy this to the file you worked on Thur. Nov 19  
You need to solve these problems using primitive recursion.

Problem 16. Thompson 10.3
  Define a function composeList which composes a list of functions 
  into a single function.
  What is the effect of your function on an empty list of functions?
  Define composeList using primitive recursion.
  
 
    ...> composeList [ (*) 2, (*) 2] 2
    8
    ...> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
    -21


Problem 17: (from http://en.wikipedia.org/wiki/Thue%E2%80%93Morse_sequence )
"In mathematics, the Thue-Morse sequence, or Prouhet-Thue-Morse sequence, is a 
binary sequence that begins:

  0 01 0110 01101001 0110100110010110 01101001100101101001011001101001 ...

(if your sequence starts with one..)
    1 10 1001 10010110 1001011001101001...."

...
"Characterization using bitwise negation

The Thue–Morse sequence in the form given above, as a sequence of bits, 
can be defined recursively using the operation of bitwise negation. So, the 
first element is 0. Then once the first 2n elements have been specified, 
forming a string s, then the next 2n elements must form the bitwise negation of 
s. Now we have defined the first 2n+1 elements, and we recurse.

Spelling out the first few steps in detail:

    * We start with 0.
    * The bitwise negation of 0 is 1.
    * Combining these, the first 2 elements are 01.
    * The bitwise negation of 01 is 10.
    * Combining these, the first 4 elements are 0110.
    * The bitwise negation of 0110 is 1001.
    * Combining these, the first 8 elements are 01101001.
    * And so on.
So
    * T0 = 0.
    * T1 = 01."
    
Define a primitive recursive function 'thue' given the nth thue element returns
the next thue element.  The elements will be represented as a list of 0s and 1s.
e.g.
   Haskell1> thue [0,1,1,0]
   [0,1,1,0,1,0,0,1]


 
Problem 18:
Define a primitive recursive function 'merge' that given two sorted lists returns 
a sorted list with all the unique elements from lists.  
e.g.
   Haskell1> merge [1,8,9,100] [3,7,9,99,100]    
   [1,3,7,8,9,99,100]


Problem 19:
Define a function replicate' which given a list of numbers returns a 
list with each number duplicated its value.   Use primitive recursion in your
definition. You may use a nested helper definition. eg.
     
     Haskell1> replicate' [2, 4, 1]
     [2,2,4,4,4,4,1]


Problem 20: Implement Newton's method for calculating the square root of N. Your
definition should use primitive recursive style.  
(See written part of this assignment)  Your definition should include a user 
defined (input) "guess" value and a user defined "nearEnough" value.  
"nearEnough" is use to determine when the guess is close enough to the square 
root.  (guess*guess = number) You should use locally defined  helper functions
to make your code more readable. You may use guards or "if expression"

e.g. 
   Haskell1> newtonAppr 144 1 0.1             
   12.000545730742438 
   Haskell1> newtonAppr 144 1 0.0001
   12.0000000124087
   Haskell1> newtonAppr 144 1 0.000000000000001
   12.0
   Haskell1> newtonAppr 5e+30 1 1000000000000000000000000000000  
   2.317148867384728e15
   Haskell1> newtonAppr 5e+30 1 100000000000000000000000000    
   2.2360684271923805e15



Problem 21:
A Define sumHarmonic using a simple recursive style:

The harmonic series is the following infinite series:
                            1   1   1   1               1
                      1 + - + - + - + - + ...  + ... - ..
                            2   3   4   5               j
(http://en.wikipedia.org/wiki/Harmonic_series_(mathematics))
Write a function sumHarmonic such that sumHarmonic i is the sum of the first j
terms of this series. For example, sumHarmonic 4 ~> 1 + 1 + 1 + 1 ~> 2.08333...
                                                        2   3   4
sumHarmonic can have the type  Fractional a => a -> a.


Problem 22: 

Given the following recursive polymorphic tree data type:

> data Tree a = Leaf | Branch a (Tree a) (Tree a)
> tree = Branch 6 (Branch 3 Leaf Leaf) (Branch 9 Leaf Leaf)

Define toList :: Tree a -> [a], that converts a tree structure to a list
structure.
    > toList tree
    [3,6,9]

What kind of tree traversal did you use?  What is the time complexity
of your code.

Problem 23:

Using the Tree data type above define toTree, which converts a list of
values to a binary tree of the values of the list. 

You may assume the following behavior: Given list [1,2,3]

1. We take 1 as the current node.
2. We split the remaining list into a left and right sublist [2] and [3],
   and convert those sublists to the left and right subtrees of the current
   node respectively.

    > toTree [1,2,3]
    Branch 1 (Branch 2 Leaf Leaf) (Branch 3 Leaf Leaf)
    > toTree [1,2,3,4,5]
    Branch 1 (Branch 2 Leaf (Branch 3 Leaf Leaf)) (Branch 4 Leaf (Branch 5 Leaf Leaf))

    Yes, the tree need not be complete.

What is the most general type of the list input?   What is the most general type
of 'toTree'?

Problem 24:  Given the following ExpTree definition:

> data ExpTree a = Leaf a | Node (a -> a -> a) (ExpTree a) (ExpTree a)

define a function 'eval', such that 'eval' evaluates an ExpTree. For 
example given :

> tree1 = Node (+) (Leaf 3) (Leaf 4)
> tree2 = Node (-) (Node (*) (Leaf 3) (Node (-) (Leaf 99) (Leaf 50))) (Leaf 10)
> tree3 = Node (++) (Leaf [3,4]) (Node (++) (Leaf [0.99]) (Leaf [-2.0,3.14]))

you get the following values:

   ...> eval tree
   7
  ...> eval tree2
  137
  ...> eval tree3
  [3.0,4.0,0.99,-2.0,3.14]

What is the most general time of 'eval'?
