> module Haskell2S12 
>  where

Problem 1a: Define sumH, using a 'fold' in your definition,
           to compute the sum of a list. 

Show the unrolling of you definition:
   sumH [1,9,11]


Problem 1b:  minus1 (defined below) subtracts all the elements of a list
             Define minus2,minus3, and minus4
             using 'foldl1', 'foldr' and foldl' for
             each respective definition to subtracts all the elements of 
             a list.  
             Do you get the same results for all lists of Integers.  Explain.
           
> minus1 = foldr1 (-)

Problem 2: Write new definitions of this function:

> f = \xs -> [ x + 5 | x <- xs, x > -1 ]
  
   ....> f [1,20,-3,15,2]
   [6,25,20,7]

  using higher-order functions, function composition, lambda expressions
  (or nested functions) and function application (NO explicit recursion). 
  (i.e. fHOF = ???)




Problem 3:    (Thompson 17.25 )
Define the list of numbers, hamming, whose only prime factors are 2, 3, and 5 , 
the so-called Hamming numbers. e.g.
   ...> take 20 hamming
   [1,2,3,4,5,6,8,9,10,12,15,16,18,20,24,25,27,30,32,36]

You may also consider using factors but is not required. 
        You may consider using any combinition of the following techiques
        to express your solution::
               list comprehension notation, 
        and/or HOF 
        and/or explicit recursion, 
        and/or local definitions  


Problem 4: Thompson 10.3  -- Below are two recursive solutions for composeList. 
 

> composeList [] = id
> composeList (h:t) = h . composeList t

> composeList1 [f] = f
> composeList1 (h:t) = h . composeList1 t

composeListHOF is a redefinition of composeList using a one of the 'fold's.
     and
composeListHOFE is a redefinition of composeListE using another of the 'fold's
     
    ...>  composeListHOF [ (-) 3 , (*) 2, (+)5 ] 7
    -21
    (33 reductions, 46 cells)

You should NOT have an argument name specified.  

------------------------- Answer ----------------------------

Problem 5: (Thompson 10.13)
  Define functions f1 and f2 so that
 
   s4 =  map f1 . filter f2

  has the same effect as
 

> p4 = filter (>0) . map (+1)

 
  ....> p4 [-4, 4, -3,3,12,-12]
  [5,4,13]
  (99 reductions, 153 cells)
  ....> s4 [-4, 4, -3,3,12,-12]
  [5,4,13]
  (90 reductions, 137 cells)
  
Answer: 



Problem 6. 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:  (hint: a lambda expressions could be useful).

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells

_________________________
Answer: 



Problem 7:
Using an  HOF (map, fold and/or filter) define flattenT that returns a list of
value in each tuple.  

7a)  The output should be in the same order as the values appear in the 
original list.
e.g.

   ...> flattenT  [(1,2), (3,4), (11,21),(-5,45)] 
   [1,2,3,4,11,21,-5,45]



7b) flattenR is the same as 9a, however, the values appear in the reverse order
from the original list.
e.g.
   ...> flattenR  [(1,2), (3,4), (11,21),(-5,45)] 
   [45,-5,21,11,4,3,2,1]


