> module Haskell2F14SOL
>    where

Problem 1:
In http://bingweb.binghamton.edu/~head/CS471/HW/Haskell1F12.html problem 2 you wrote a function
to create the next thue value.

Using the circular list idea demostrated in fibSeq
  (http://bingweb.binghamton.edu/%7Ehead/CS471/NOTES/HASKELL/4hF02.html)
  Define thueSeq to be a sequence of thue elements.
  You should use list comprehension. May use the 'thue' definition from your homework.
e.g.
  
  Haskell2F14> take 5 thueSeq
  [[0],[0,1],[0,1,1,0],[0,1,1,0,1,0,0,1],[0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0]]

 
Problem 2:  In http://bingweb.binghamton.edu/~head/CS471/HW/Haskell1F14.html problem 1 
  you wrote a function to create the next thue value. Above you used an infinite list 
  Redefine thueSeq, with the name thueSeqM,  using map instead of list comprehension --
  My solution was  coded using (++), map, lambda expression and mod. I did not use thue from 
  problem 2. 



Problem 3:  (List comprehension)
(Only use list comprehension notation )
(From Thompson 17.23)  Give a definition of the function

    factors :: Integral a => a -> [a]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]


  
Problem 4 Thompson 10.3
  In Haskell 1 you did the following problem:
  Problem 2: Thompson 10.3
  Define a function composeList which composes a list of functions 
  into a single function.
  What is the effect of your function on an empty list of functions?
  Define composeList using primitive recursion.
  
Redo the definition. The definition should use a 'fold' and it 
   should be only be one line AND no explicit arguments (i.e. complete
   composeHOF = ?????).


Problem 5: (Thompson 10.13)
  Find functions 'f1' and 'f2' so that
 
   s8 =  map f1 . filter f2

  has the same effect as

(NOTE this was missing in the original assignment MW)
   
  filter (>0) . map (+1)


  ....> s8 [-4,4, -3,3,12,-12]
  [5,4,13]
  (90 reductions, 137 cells)



Problem 6. 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for 'g1' and 'g2' so the following evaluation 
is valid:  (hint: a lambda expressions could be useful).
(Note that  (77 reductions, 123 cells) is time and memory from Hugs, ghci will give time and 

     g1 (g2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> g1 ( g2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells)  


Problem 7: Write new definitions of this function:

> f = \xs -> [ x * (mod x 5) | x <- xs, x > 5 ]
 
a. using explicit recursion and pattern-matching, without guards , call it 'fr'.



b. using explicit recursion and guards, without pattern-matching, call it 'frnp'

c. using higher-order functions, function composition, lambda expressions and
   function application (NO explicit recursion), call it 'fhof'.



