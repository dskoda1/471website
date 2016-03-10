
> module Haskell2S04 where

YOUR NAME, EMAIL


Purpose:  To practice the abstraction using Higher order function.
          Some more experience with list comprehension notation.
          


Practice and experimenting:
(Do not turn or print out the practice and experimenting section)


You can switch off the requirement of using "show" in the display by
   > :s -u
and turning it on
   > :s +u

If "show" is turned on then the following will generate an error

   Haskell2S04> :s +u
   Haskell2S04> (+)
   ERROR - Cannot find "show" function for:
   *** Expression : (+)
   *** Of type    : Integer -> Integer -> Integer


Turning off show will give you:

   Haskell2S04> :s -u
   Haskell2S04> (+)
   primPlusInteger
   (10 reductions, 30 cells)

You can get the number of reductions and number of cells used by setting
    :s +s



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


Problem 1. (easy)
Given a list of pairs create a list of lists where each nested list has the
elements from the corresponding pair.  What is the inferred type?
   Haskell2S04> pair2listPR [(1,3.4),(12,3.5)]
   [[1.0,3.4],[12.0,3.5]]

a) Use primitive recursion

 > pair2listPR [] = []
 > pair2listPR 

b) Use list comprehension notation

 > pair2listLC lst = ? 

c) Use function application of HOF (you may use a nested function definition)

 > pair2listHOF  = ?




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

 > distanceLC lst = ?

Use function application of HOF to create this list.  You may define a
nested function to complete this script.  
Challenge: code in one line. 


  > distanceHOF = ?



Problem 3: Thompson 10.3
  Define a primitive recursive function composeList which composes 
  a list of functions into a single function.
  What is the effect of your function on an empty list of functions?
  Rewrite this using only function(HOF) application.
  
 
    HaskellS034> composeList [ (*) 2, (*) 2] 2
    8
   (26 reductions, 32 cells)
    HaskellS034> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
    -21
    (32 reductions, 41 cells
    HaskellS034>  composeListHOF [ (-) 3 , (*) 2, (+)5 ] 7
    -21
     (32 reductions, 41 cells)
    HaskellS034>  composeListHOF2 [ (-) 3 , (*) 2, (+)5 ] 7
    -21
    (33 reductions, 46 cells)



 > composeList [] = id
 > composeList (h:t) =  ?


 > composeListHOF  = ?




Problem 4:

Define a function reorder that reverses the order of two arguments to
a function.  YOU ARE to use a lambda expression in your solution.
Predict the inferred type.
    Haskell2S04> reorder (-) 99 1
    -98
    Haskell2S04> (-) 99 1
    98
   
 > reorder = ?







Problem 5:
convert2digit takes a string of digits and returns a list of Integers.


   Haskell2S04> convert2digitLC "1369"
   [1,3,6,9]
   (85 reductions, 129 cells)

   Haskell2S04> convert2digitHOF "1369"
   [1,3,6,9]
   (90 reductions, 131 cells)




a) Use list comprehension notation in your solution.
   > convert2digitLC lst = ?

>


b) Use function application of HOF functions.  You may use a nested
   helper function definition. Challenge - code it in one line.


  > convert2digitHOF lst  =





6) (easy) In the last homework  we had the following problem:
      Let  f(x) = 3x + 2
      and   g(x) = 2x + 3


   1.  What is the function composition,  (f o g) (x ) = ?

   2.  What is  (g o f) (x ) = ?

   3.  What is the value of  (f o g) (2 ) = ?

   4.  What is the value of (g o f ) (2 ) = ?

a)  Define f and g in haskell.  Can you predict the inferred type?
b) Define h1 and h2 such both will give the same answer (as 1 above). 
   h1 should be defined without an argument and h2 should have an argument.
c) Define h3 and h4 such both will give the same answer (as 2 above). 
   h3 should be defined without an argument and h4 should have an argument.

Compare your output with the expected values computed in homework1.






Problem 7. 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:  (hint: a lambda expressions could be useful).

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells

 > f1 lst y = ?

 > f2 = ?


Problem 8: (Thompson 10.13)
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



  > s9 = ?

