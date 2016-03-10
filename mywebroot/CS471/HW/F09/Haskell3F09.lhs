> module Haskell3F09
>    where

1) Write a Haskell script to calculate the n-th tetrahedral number. 
   http://milan.milanovic.org/math/english/tetrahedral/tetrahedral.html 

   To calculate the n-th tetrahedral number:
     add the previous tetrahedral number to the sum of the numbers, 1 to n.

   The first few tetrahedral numbers are:

        1, 4, 10, 20, 35, 56, 84, 120, 165, 220, 286, 364, 455, 560, 680 ...

    This solution should use primitive recursion. You may use a local
    definition for the sum of the numbers 1 to n.

	i.e. 
	Haskell3F09> tetrahedral 10
   220




problem 2. pairWiseProdLC takes the product of each pair of numbers in a list.
   Write a nonrecursive definition, using list comprehension notation.
   
     ...> pairWiseProdLC [(1,2),(4,5),(7,0)]
     [2,20,0]


Problem 3. Using the circular list idea demostrated in fibSeq
  (http://bingweb.binghamton.edu/~head/CS471/NOTES/HASKELL/4hF02.html)
   Define tetraseq which is a sequence of tetrahedral numbers.  YOU SHOULD
   NOTE USE PROBLEM 1 in your solution.  This will be a one line wonder.
   ....> take 10 tetraseq
   [1,4,10,20,35,56,84,120,165,220]




Problem 4: Thompson 10.3
  Define a primitive recursive function composeList which composes 
  a list of functions into a single function.
  What is the effect of your function on an empty list of functions?
  Rewrite this using only function(HOF) application.
  
 
    HaskellF09> composeList [ (*) 2, (*) 2] 2
    8
   (26 reductions, 32 cells)
    Haskell3F09> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
    -21
    (32 reductions, 41 cells
    Haskell3F09>  composeListHOF [ (-) 3 , (*) 2, (+)5 ] 7
    -21
     (32 reductions, 41 cells)
    Haskell3F09>  composeListHOF2 [ (-) 3 , (*) 2, (+)5 ] 7
    -21
    (33 reductions, 46 cells)



 > composeList [] = id
 > composeList (h:t) =  ?


 > composeListHOF  = ?



Problem 5:  (List comprehension)

(Only use list comprehension notation.)
(From Thompson 17.23)  Give a definition of the function

    factor :: Integral -> [Integral]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]





Problem 6:  (Thompson 17.23 )

Define the list of numbers whose only prime factors are 2, 3, and 5 , the
so-called Hamming numbers:


   Haskell3F09> take 15 hamming
   [1,2,3,4,5,6,8,9,10,12,15,16,18,20,24]

 You may also consider using factors but is not required. 
 You may consider using any combinition of the following techiques
       to express your solution  list comprehension notation, 
       and/or explicit recursion, and/or local definitions . 
           



Problem 7: Write new definitions of this function:

> f = \xs -> [ x * (mod x 5) | x <- xs, x > 5 ]
 
a. using explicit recursion. 


b. using higher-order functions, function composition, lambda expressions and
   function application (NO explicit recursion). 



Problem 8:

a) (T9:11) How would you define the sum of the squares of the natural numbers 1 to n 
using map and foldr?


 
b) How would you define the sum of the squares of a list of integers
using map and foldr and (.).  You will have NOT explicit arguments.  



May use foldr foldr1 foldl foldl2

Problem 9: (Note: do not specify the argument for problem 8)
 9a: Use map to define a  lengths that takes a list of lists and
returns a list of corresponding langths. i.e.

  Haskell3F09> lengths [[12,4,5,6],[1,2,4],[1,2]]
  [4,3,2]
  




 9b: Use map and a "fold" to define  sumLengths that takes a
list of lists and returns the sum of all their lengths. i.e.
  
  Haskell3F09> sumlengths [[12,4,5,6],[1,2,4],[1,2]]
  9

  > sumlengths = 




Problem 10. 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:  (hint: a lambda expressions could be useful).

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells



Problem 11: (Thompson 10.13)
  Find functions f1 and f2 so that
 
   s9 =  map f1 . filter f2

  has the same effect as
 

> p9 = filter (>0) . map (+1)

 
  ....> p9 [-4,4, -3,3,12,-12]
  [5,4,13]
  (99 reductions, 153 cells)
  ....> s9 [-4,4, -3,3,12,-12]
  [5,4,13]
  (90 reductions, 137 cells)



Problem 12.
Using an  HOF (map, fold and/or filter) define flattenT that returns a list of
value in each tuple.  

12a)  The output should be in the same order as the values appear in the 
original list.
e.g.

   ...> flattenT  [(1,2), (3,4), (11,21),(-5,45)] 
   [1,2,3,4,11,21,-5,45]


12b) flattenR is the same as 12a, however, the values appear in the reverse order
from the original list.
e.g.
   ...> flattenR  [(1,2), (3,4), (11,21),(-5,45)] 
   [45,-5,21,11,4,3,2,1]


 

