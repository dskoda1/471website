> module Haskell4F05
>     where

Practice:
What does [1 ,3 .. 100] generate?
What does [100 , 97 .. 1] generate?

What is the most general type (if any) of
   A) map map
   B) foldl foldl
   C) map foldl
   D) map . foldl

What is the value of :
   (map . foldl1) (-) [[1,2,3],[3,2,1],[100,200,300]]
    map (\v ->  v [4000,1000]) (map foldr1 [div,(-)])
    map (\f -> f [3,4,5])  (map map [(*) 3,(-) 4])


What is the value of mapmap ? Try and figure it out then run it.

 
> mapmap = map (\x-> x [1,2,3])(map map [odd,even])

________________________________________________


Problem 1: Thompson 10.3
  Define a primitive recursive function composeList which composes 
  a list of functions into a single function.
  What is the effect of your function on an empty list of functions?
  Rewrite this using only function(HOF) application.
  
 
    HaskellS052> composeList [ (*) 2, (*) 2] 2
    8
   (26 reductions, 32 cells)
    HaskellS052> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
    -21
    (32 reductions, 41 cells
    HaskellS052>  composeListHOF [ (-) 3 , (*) 2, (+)5 ] 7
    -21
     (32 reductions, 41 cells)
    HaskellS052>  composeListHOF2 [ (-) 3 , (*) 2, (+)5 ] 7
    -21
    (33 reductions, 46 cells)



 > composeList [] = id
 > composeList (h:t) =  ?


 > composeListHOF  = ?



Problem 2:
Define a function that computes the value of e^x using the series expansion

       e^x = 1 + x + (x^2 / 2!) + ( x^3 / 3!) + ... + ( x^n / n!) + ...

  You may or may not find use for
  the below functions:
       powersOf and fact;
  and the Prelude function:
       sum, zip, zipWith, and takeWhile;
  in your definitions.  You should use "where clause" to
  promote readability of your code. Your solution should discard all
  terms of the series smaller than 0.000001.


> powersOf x = iterate (\n -> n * x) 1.0

> fact  = 1.0:zipWith (*) [1.. ] fact 


I have implemented 2 different solutions e2X and a more efficient version eToX.
    ...> eToX 3.5
    33.1154
    (492 reductions, 824 cells)
    ...> e2X 3.5
    33.1154
    (6544 reductions, 8402 cells)
    ...> eToX 5.1
    164.022
   (622 reductions, 1039 cells)
    Main> e2X 5.1
    164.022
    (10586 reductions, 13562 cells)



Problem 4: Write new definitions of this function:

> f = \xs -> [ x * (mod x 5) | x <- xs, x > 5 ]
 
a. using explicit recursion and pattern-matching, without guards. 




b. using explicit recursion and guards, without pattern-matching.



c. using higher-order functions, function composition, lambda expressions and
   function application (NO explicit recursion). 




Problem 5:

a) (T9:11) How would you define the sum of the squares of the natural numbers 1 to n 
using map and foldr?

 > sumSq n = ??
 
b) How would you define the sum of the squares of a list of integers
using map and foldr and (.).  You will NOT have explicit arguments.  

  > subSq2 = ???

May use foldr foldr1 foldl foldl2



Problem 6: 

For the purposes of this exercise you should use foldr1 to give definition of the 
prelude function last.  Use foldr to give the definition of prelude function
unzip.

  > unzipR = ???
  > lastR =  ???




Problem 7:

a) How would you define the length function using map and sum? 
  > lengthHOF = ???


b)How would you define the length function using map and a "fold".

  > lengthHOF2 = ???


Problem 8: (Note: do not specify the argument for problem 8)
 8a: Use map to define a  lengths that takes a list of lists and
returns a list of corresponding langths. i.e.

  Haskell4F05> lengths [[12,4,5,6],[1,2,4],[1,2]]
  [4,3,2]
  

  > lengths = ??


 8b: Use map and a "fold" to define  sumLengths that takes a
list of lists and returns the sum of all their lengths. i.e.
  
  Haskell4F05> sumlengths [[12,4,5,6],[1,2,4],[1,2]]
  9

  > sumlengths = ???






Problem 9: (Thompson 10.13)
  Find functions f1 and f2 so that
 
   s9 =  map f1 . filter f2

  has the same effect as
 

> p9 = filter (>0) . map (+1)

 
  Haskell2S04> p9 [-4,4, -3,3,12,-12]
  [5,4,13]
  (99 reductions, 153 cells)
  Haskell2S04> s9 [-4,4, -3,3,12,-12]
  [5,4,13]
  (90 reductions, 137 cells)






Problem 10. 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:  (hint: a lambda expressions could be useful).

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells



