> module Haskell4S06
>     where

Practice:
(This should be done right after HOF are introduced in Lecture)
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

____________________________________________________


Problem 1:  Redo problem hw 12 problem 8 using List comprehension notation as 
much as possible.
(hint look at the fast solution for fib)

i.e.
  Haskell4S06> sumLC [3,4,1,2,3]
  [3,7,8,10,13]


Answer:




Problem 2) Recode the following explicit recursive definition using 
           function application of fold (either foldr or foldl)

> composeList [] = id
> composeList (h:t) = h . composeList t

Here is a sample execution:

   ...> composeList [(3*),(100+),(2*)] 3
   318
   ...> (.) (+) (composeList [(3*),(100+),(2*)]) 3 1000
   1318

Solution:





Problem 4: Write new definitions of this function:

> f = \xs -> [ x + 5 | x <- xs, x > -1 ]
 
a. using explicit recursion 


b. using higher-order functions, function composition, lambda expressions or
   function application (NO explicit recursion). 


Problem 5:
Use a "fold" in your solution and no explicit arguments:

a) define "allTrue"  which evaluates to True if all the expression in
   a list are true.  Provide two test cases. 



b)  define "noneTrue"  which evaluates to True if NONE*** the boolean 
    expression in a list are true. Provide two test cases.




Problem 6:

a) (T9:11) How would you define the sum of the squares of the natural numbers 1 to n 
using map and foldr?  Do not have explicit arguments except for "n".

  > sumSq n = ????
 
b) How would you define the sum of the squares of a list of integers
using map and foldr and (.).  You will have NOT explicit arguments.  









Problem 7: Do not include the explicit arguments.
 7a: Use map to define a  lengths that takes a list of lists and
returns a list of corresponding langths. i.e.

  Haskell4F05> lengths [[12,4,5,6],[1,2,4],[1,2]]
  [4,3,2]
  

  > lengths = ????


 7b: Use map and a "fold" to define  sumLengths that takes a
list of lists and returns the sum of all their lengths. i.e.
  
  Haskell4F05> sumlengths [[12,4,5,6],[1,2,4],[1,2]]
  9

  > sumlengths = 






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

_________________________
Answer: 





Problem 9: You solution must include the use of map and filter.
You may also use fst or snd, lambda abstraction, where  clauses, or let clauses.
There should be no explicit arguments used in the definition.

Given a list s of tuples, the function sym ::  Eq a => [(a,a)] -> [a],
produces a list of all s such that (x,x) is an element of s.  

e.g.
  ...>  sym  [(2,3),(3,3),(0,0),(4,0)]
  [3,0]
  ...>  sym [(2,3),(4,5)]
  []


Problem 10:
Define a function concatAndMap :: (a -> [b]) -> [a] -> [b], when 
concatAndMap f xs evaluated, concatAndMapp applies f to each element of xs, 
and then concatenates all of the lists that f returns. 
e.g.
  ...> concatAndMap (\x-> [even x]) [1,2,3]
  [False,True,False]

  ...> concatAndMap (333:)[[1,2],[3]]
  [333,1,2,333,3]

   ...>concatAndMap (filter even)[[1,2],[3],[4,5,6]]
  [2,4,6]
  ...> concatAndMap (replicate 2) [1..5]
  [1,1,2,2,3,3,4,4,5,5]

Problem 11. 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:  (hint: a lambda expressions could be useful).

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells

_________________________
Answer: 
