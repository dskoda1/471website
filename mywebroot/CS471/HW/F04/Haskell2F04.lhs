> module Haskell2F04 where

YOUR NAME, EMAIL


Purpose:  To practice the abstraction using Higher order function.
          Some more experience with list comprehension notation.
          


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
Given a two lists with values of type of Fractional. Define 4 different
functions to create a list of the average of the corresponding numbers.
Each function will employ different techniques.
    
For example: 
  Haskell2F04> averagePairsPR [3, 55, 1000, 12] [3, 11 ..]
  [3.0,33.0,509.5,19.5]

All different functions should give the same results.

a)Define the function using explicit recursion

> averagePairsPR :: Fractional f => [f] -> [f] -> [f] 


b) Define a partially evaluated function, averagePairZ by 
   using zipWith and a lamdba expression. (This will be only one line)

> averagePairsZ :: Fractional f => [f] -> [f] -> [f]
> averagePairsZ =


c) Define the function using list comprehension notation

> averagePairsLC :: Fractional f => [f] -> [f] -> [f] 
> averagePairsLC xs ys =


d) Define a function using function application 
   of map ,lambda expression, zip to calculate the average. 

> averagePairsHOF :: Fractional f => [f] -> [f] -> [f] 
> averagePairsHOF xs ys =




Problem 2.
Given two points,(x1,y1) and (x2,y2) the distance between them is
squareRoot((x1-x2)^2 +(y1-y2)^2)

> data Point a = Pt a a deriving Show

  Haskell2S04> distanceLC [(Pt 0 0, Pt 0 4),(Pt 1 1, Pt 2 2),(Pt 0 0, Pt 3 4)]
  [4.0,1.4142135623731,5.0]
  (646 reductions, 1015 cells)
  Haskell2S04> distanceHOF [(Pt 0 0, Pt 0 4),(Pt 1 1, Pt 2 2),(Pt 0 0, Pt 3 4)]
  [4.0,1.4142135623731,5.0]
  (626 reductions, 1017 cells)

Given a list of pairs of Points create a list of corresponding distances.
Use list comprehension notation create a list of distances.

> distanceLC lst = 

Use function application of HOF and a lambda expression to create this list.  

           
> distanceHOF1 = 


Problem 3: Thompson 10.3
  Define a primitive recursive function composeList which composes 
  a list of functions into a single function.
  What is the effect of your function on an empty list of functions?
  Rewrite this using only function(HOF) application.
  
 
    Haskell2F04> composeList [ (*) 2, (*) 2] 2
    8
   (26 reductions, 32 cells)
    Haskell2F04> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
    -21
    (32 reductions, 41 cells
    Haskell2F04>  composeListHOF [ (-) 3 , (*) 2, (+)5 ] 7
    -21
     (32 reductions, 41 cells)
    Haskell2F04>  composeListHOF2 [ (-) 3 , (*) 2, (+)5 ] 7
    -21
    (33 reductions, 46 cells)



 > composeList [] = id
 > composeList (h:t) =  ?


 > composeListHOF  = ?



Problem 4:
convert2digit takes a string of digits and returns a list of Integers.


   Haskell2F04> convert2digitLC "1369"
   [1,3,6,9]
   (85 reductions, 129 cells)

   Haskell2F04> convert2digitHOF "1369"
   [1,3,6,9]
   (90 reductions, 131 cells)




a) Use list comprehension notation in your solution.





b) Use function application of HOF functions.  You may use a nested
   helper function definition. Challenge - code it in one line.
 






Problem 5: Write new definitions of this function:

> f = \xs -> [ x+3 | x <- xs, x > 0 ]
 
a. using explicit recursion and pattern-matching, without guards. 
  Include the function most general type.

> fr :: Num a => [a] -> [a]



b. using explicit recursion and guards, without pattern-matching.

> fr2 xs


c. using higher-order functions, function composition, lambda expressions and
   function application without explicit recursion. 

> fHOF = 


Problem 6. 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:  (hint: a lambda expressions could be useful).

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells




Problem 7: (Thompson 10.13)
  Find functions f1 and f2 so that
 
   s9 =  map f1 . filter f2

  has the same effect as
 

> p9 = filter (>0) . map (+1)

 
  Haskell2F04> p9 [-4,4, -3,3,12,-12]
  [5,4,13]
  (99 reductions, 153 cells)
  Haskell2F04> s9 [-4,4, -3,3,12,-12]
  [5,4,13]
  (90 reductions, 137 cells)




Problem 8: Given this definition

> data Tree a = Nil | Node (Tree a) a (Tree a)

define the function mapTree so that for any t::Tree a and 
function f :: a -> b, mapTree f t is a tree that has the same shape as t, 
but in which each of its labels, say x, is replaced by f x .

i.e.
Haskell2F04> :s -u
Haskell2F04> mapTree (even) (Node (Node Nil 5 (Node Nil 8 Nil)) 10 Nil)
Tree_Node (Tree_Node Tree_Nil Bool_False (Tree_Node Tree_Nil Bool_True 
           Tree_Nil)) Bool_True Tree_Nil
(111 reductions, 325 cells)

