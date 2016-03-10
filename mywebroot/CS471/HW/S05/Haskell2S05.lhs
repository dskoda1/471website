> module Haskell2S05 where

YOUR NAME, EMAIL
Purpose:  To practice the abstraction using Higher order function.
          Some more experience with list comprehension notation.
          More practice with primitive recursion.
          

Practice and experimenting:
(Do not turn or print out the practice and experimenting section)

What do the following functions do?
  ...> drop 4 [1 .. 10]
  ...> take 4 [1 .. 10]
  ...> dropWhile (>44) [100, 85 .. 1]
  ...> splitAt 4 "abdcxyz"
  ...> fromEnum True
  ...>  (\c -> fromEnum c - fromEnum 'A') 'a'

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



10.2 (Thompson) (id is a built in function) 
     If id is the polymorphic identity function, defined by
      id x = x
     explain the behavior of the expressions:
     
     (id . f)       (f .id )         id f

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Problem 1. 
Define member function using 2 different techinques:

a) Definition, memberPR,  should employ explicit recursion and 
   NO if expression:






b) Definition, memberHOF, should use foldr.  You should use a lambda 
   expression as part of your solutions.  






Problem 2.
Below is a user define data type Point and Shape and the definition of
area for a Triangle shape:

> data Point  = Pt Float Float deriving Show

> data Shape = Rectangle Point Point 
>              |Circle Point  Float
>              |Triangle Point Point Point

> area (Triangle (Pt x1 y1) (Pt x2 y2) (Pt x3 y3)) = sqrt(s*(s-a)*(s-b)*(s-c))
>      where
>      a = sqrt((x2- x1)^2 + (y2- y1)^2)
>      b = sqrt((x3- x2)^2 + (y3- y2)^2)
>      c = sqrt((x3- x1)^2 + (y3- y1)^2)
>      s = (a+b+c)/2.0
  

Write the definition for area of a Circle and Rectangle shape.




Problem 3:

Given a list of Shapes define, areas, which returns a list of areas of 
each shape.  
a) Your first code (areasLC) should employ list comprehension
as part of your solution (can you write it without an argument?): 

 ..> areasLC [Rectangle (Pt 0.0 5.0) (Pt 1.0 10.0), Circle (Pt 0.0 1.0) 4.5]
 [5.0,63.61725] 
           
b) Your second solution, areasHOF, should employ HOF(map, fold and/or filter)
    as part of your solution:





Problem 4: Thompson 10.3
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





Problem 5: 
The definition average, so that if ns is a non-empty list of Ints, average ns is 
their average. A simple definition of average would be

> average :: [Integer] -> Double
> average ns = fromInteger (sum ns) / (fromInteger.toInteger) (length ns)

but this makes two passes over ns. 
Define a more efficient implementation of 
average which makes a single pass, using the function
    sumAndLength :: [Integer] -> (Integer,Integer)
This function satisfies the equation
    sumAndLength ns = (sum ns, length ns)
but produces its result in a single pass over ns


 > averageFast :: [Integer] -> Double
 > averageFast ns = total / count 
 >     where
 finish the code

Problem 6: Write new definitions of this function:

> f = \xs -> [ x * (mod x 3) | x <- xs, x > 3 ]
 
a. using explicit recursion and pattern-matching, without guards. 

REdo solutions




b. using explicit recursion and guards, without pattern-matching, you may
   use nested definitions



c. using higher-order functions, function composition, lambda expressions and
   function application (NO explicit recursion). 

 > fHOF = complete


Problem 7:
Louden page 530 problem 11.7 part b.  

   Haskell2S05> binCoef 10 5
   252 
   Haskell2S05> binCoef 20 10
   184756

Problem 8:  
Rewrite problem 7 by completing the where part of the definition below. 
Your solution should employ list comprehensive notation.  My solution required
two definitions, (Think about the dynamic programming techique 
and  binCoefSeq is a list of lists of Integer. )  
Which solution is faster? (8 or 7) Can you explain why?

  Haskell2S05> binCoefLC 4000 20
  430935842846395817171619344153709943715872089267709800 
  Haskell2S05> binCoefLC 100 40
  13746234145802811501267369720
  Haskell2S05> binCoefLC 50 4
  230300            

 
 > binCoefLC n k = binCoefSeq !! n !!k
 >     where
 Complete definition




Problem 9. 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:  (hint: a lambda expressions could be useful).

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells

_________________________
Answer: 





Problem 10: (Thompson 10.13)
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

_________________________
Answer: 








