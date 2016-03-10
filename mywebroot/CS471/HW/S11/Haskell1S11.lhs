> module Haskell1S11
>     where


Due on WED, May 4 at end of day.
 
Questions 1 & 2 us only primitive recursive style.

Problem 1: Thompson 10.3
  Define a function composeList which composes a list of functions 
  into a single function.
  What is the effect of your function on an empty list of functions?
  
  Define composeList using primitive recursion.
  
 
    ...> composeList [ (*) 2, (*) 2] 2
    8
   (26 reductions, 32 cells)
    ...> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
    -21
    (32 reductions, 41 cells
    ...>  composeListHOF [ (-) 3 , (*) 2, (+)5 ] 7
    -21
     (32 reductions, 41 cells)
     
     
Problem 2: Write a Haskell script to calculate the n-th tetrahedral number. 
   http://milan.milanovic.org/math/english/tetrahedral/tetrahedral.html 

   To calculate the n-th tetrahedral number:
     add the previous tetrahedral number to the sum of the numbers, 1 to n.

   The first few tetrahedral numbers are:

        1, 4, 10, 20, 35, 56, 84, 120, 165, 220, 286, 364, 455, 560, 680 ...

    This solution should use primitive recursion. You may use the builtin
    definition of sum.


Problem 3: Implement Newton's method for calculating the square root of N. 
Your definition should include a user defined (input) "guess" value and a
user defined "nearEnough" value.  "nearEnough" is use to determine
when the guess is close enough to the square root.  (guess*guess = number)

e.g. 
   Haskell1S11> newtonAppr 144 1 0.1             
   12.000545730742438 
   Haskell1S11> newtonAppr 144 1 0.0001
   12.0000000124087
   Haskell1S11> newtonAppr 144 1 0.000000000000001
   12.0
   Haskell1S11> newtonAppr 5e+30 1 1000000000000000000000000000000  
   2.317148867384728e15
   Haskell1S11> newtonAppr 5e+30 1 100000000000000000000000000    
   2.2360684271923805e15

 
We will cover List comprehension Monday in Class and you should be able
to do the next 3 problems.

Problem 4: Define sq, which creates a list of square values from a list of 
numbers.  Use list comprehension notations in your solution. (Very easy)



Problem 5: Define the function flat:: [[a]]->[a], which takes a lists of lists, 
ass,  and returns a list of with all the list in ass concatenated. This is a one
line wonder. Your solution should use list comprehension notation. 

  ...> flat ["asdf","xyz","azbx","1234","+*"]
  "asdfxyzazbx1234+*"
  ...> flat [[1,2],[99],[33,2,1]]
  [1,2,99,33,2,1]



Problem 6:
Define a function replicate which given a list of numbers returns a 
list with each number duplicated its value.  Use only list comprehension
notation in your solution.  i.e.
  ..> replicate [5,1,3,2,8,1,2]
  [5,5,5,5,5,1,3,3,3,2,2,8,8,8,8,8,8,8,8,1,2,2]



