> module LabH4S11
>  where

Some Helpful Links
http://bingweb.binghamton.edu/~head/CS471/NOTES/HASKELL/5HOFhF02.html
http://haskell.org/haskellwiki/Fold
http://haskell.org/haskellwiki/Foldr_Foldl_Foldl%27


Problem 1: Write new definitions of this function:

> f = \xs -> [ x + 5 | x <- xs, x > -1 ]
  
   ...> f [1,20,-3,15,2]
   [6,25,20,7]

   Using explicit recursion and pattern-matching, without guards-- OR --
   using explicit recursion with guards but without pattern-matching.  You
   may use explicit arguments.


Problem 2a: Define sumH, using a 'fold' in your definition,
           to compute the sum of a list. 



Show the unrolling of you definition for the following application:
   sumH [1,9,11]


Problem 2b:  minus1 (defined below) subtracts all the elements of a list
             Define minus2,minus3, and minus4
             using 'foldl1', 'foldr' and foldl' for
             each respective definition to subtracts all the elements of 
             a list.  
             Do you get the same results for all lists of Integers.  Explain.
             Give a good example to illustrate the problem.
          

> minus1 = foldr1 (-)


Problem 3: (See exercise after the hw solution.) 
    Thompson 10.3  In the last homework you did a version of the following problem.
    Define two primitive recursive function a) composeListE and b)composeList which 
    composes a list of functions into a single function.
    
    a) The base case should be defined for
      composeListE []
    b) The base case should be defined for
      composeList [f]
    ...> composeList [ (*) 2, (*) 2] 2
    8
    (26 reductions, 32 cells)
    ...> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
    -21
 Solutions for homework:

> composeListE [] = id
> composeListE (h:t) = h . composeListE t

> composeList [f] = f
> composeList (h:t) = h . composeList t

EXERCISE
----- you need to show the unrolling for the above definitions---
Show the step by step unrolling (evaluation) of
     composeListE [ (*) 3, (+) 2] 5
and        
     composeList [ (*) 3, (+) 2] 5

Problem 4:

 (Rewrite above problem -- The unrolling should help you select the fold that corresponds to
  the definitions in 3.)
     composeListHOF is a redefinition of composeList using a one of the 'fold's.
       and
     composeListHOFE is a redefinition of composeListE using a one of the 'fold's
     
    ...>  composeListHOF [ (-) 3 , (*) 2, (+)5 ] 7
    -21
    (33 reductions, 46 cells)

You should NOT have an argument name specified.  




Problem 5:
Using a fold in your solution:

a) Define  "allTrue" to evaluate a list of expression of Bools to True if all 
   the expression in a list are true.  Provide two test cases.  Do not have an
   explicit parameters.  (i.e. allTrue = ???)



b)  define "noneTrue"  which evaluates to True if none of the boolean 
    expression in a list are true. Provide two test cases. Do not have an
    explicit argument.  (i.e. noneTrue = ???) (Hint: You should use compose to 
    "glue" some of the functions so you don't need explicit parameters.)
    




Problem 6 : Use map to define a  lengths that takes a list of lists and
returns a list of corresponding lengths. i.e.
 
  ...> lengths [[12,4,5,6],[1,2,4],[1,2]]
  [4,3,2]
  


Problem 7: Use 'map', a 'fold', (.), length and "()"  to define  sumLengths 
           that takes a list of lists and returns the sum of all 
           their lengths. (A little tricky) i.e.  
  
  ...> sumlengths [[12,4,5,6],[1,2,4],[1,2]]
  9

  > sumlengths = 


 

Problem 8: (Thompson 10.13)
  Find functions f1 and f2 so that
 
   s4 =  map f1 . filter f2

  has the same effect as
 

> p4 = filter (>0) . map (+1)

 
  ....> p4 [-4, 4, -3,3,12,-12]
  [5,4,13]
  (99 reductions, 153 cells)
  ....> s4 [-4, 4, -3,3,12,-12]
  [5,4,13]
  (90 reductions, 137 cells)
  
  
Problem 9.
Using an  HOF (map, fold and/or filter) define flattenT that returns a list of
value in each tuple.  

9a)  The output should be in the same order as the values appear in the 
original list.
e.g.

   ...> flattenT  [(1,2), (3,4), (11,21),(-5,45)] 
   [1,2,3,4,11,21,-5,45]

  > flattenT = 

9b) flattenR is the same as 9a, however, the values appear in the reverse order
from the original list.
e.g.
   ...> flattenR  [(1,2), (3,4), (11,21),(-5,45)] 
   [45,-5,21,11,4,3,2,1]

  > flattenR = 

