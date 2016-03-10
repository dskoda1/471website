Modified Wed 8:10pm

You do not have include above the "+++++" line in your hard copy.
DONT forget to put you name after the "++++++" below

Purpose:  Practice primitive recursive functions 
          practice using list comprehension to define functions
          practice using partially evaluated functions (curried functions)
          see the use of compose function (.)
          anonymous function (lambda functions)
          practice HOF
          keep learning about types.


Note: In the homework file put only one space between ">" and the code.  
Do not use a tab...  JUST one SPACE.

Turning off show will give you:

   HaskellF033> :s -u
   HaskellF033> (+)
   primPlusInteger
   (10 reductions, 30 cells)

There practice problems will be useful to your 
understanding of HOF.  Please take look and think about
these problems a couple of times before the Haskell quiz.


Practice 1) Give an example of a partially evaluated functions.

Practice 2) What does the following evaluate to?  (IMPORTANT)
     (\x y -> x * y) 2 3 
     (\x y ->  x y) (\x -> (-) x) 4 5


Practice 3 ) What is the most general type (if any) of
   A) map map
   B) foldl foldl
   C) map foldl
   D) map . foldl

Practice 4) What is the value of :
   (map . foldl1) (-) [[1,2,3],[3,2,1],[100,200,300]]
    map (\v ->  v [4000,1000]) (map foldr1 [div,(-)])
    map (\f -> f [3,4,5])  (map map [(*) 3,(-) 4])


Practice 5) What is the value of mapmap ? Try and figure it out then run it.
  (Defined in the code: > mapmap = map (\x-> x [1,2,3])(map map [odd,even]) )
  

Practice 6 -- P0.2 (Thompson)) (id is a built in function) 
     If id is the polymorphic identity function, defined by
      id x = x
     explain the behavior of the expressions:
     
     (id . f)       (f .id )         id f

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
For all the code you write you should try to figure out the most general type.

YOUR NAME, EMAIL

> module Haskell3F03
>     where

 

Note: 
I have put in the ">" where your code should be place.  Sometimes
I have indicated the first line of the code for you to complete
       > function arg = ?
  or 
       > function arg

I have also indicated if you should put the type by including a line
      > function :: ?
You should try to figure out the most general type that will work.

Because of these "?"  you will get errors when you load this file into 
hugs.


Problem 1.
Use only list comprehension notation to define repeatN which creates a list of numbers where
each number is repeated it's number times. ie.
i.e. 
    HaskellF033SOL> take 20 repeatN
    [1,2,2,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,6,6]

    HaskellF033SOL> take 30 repeatN
    [1,2,2,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,6,6,6,7,7,7,7,7,7,7,8,8]


  
> repeatN =

Problem 2.
A) Write a Haskell function using recursion and function application
   in the following format:

   >   palindrome :: String -> Bool
   >   palindrome [] = ...
   >   palindrome [x] = ...
   >   palindrome x = ... -- uses head, last, init, tail and primitive recursion

B) Rewrite using a function application of "reverse"


Problem 3&4:
Define a functions occurrences so that "occurrences" xs 
    returns a list containing 
  one copy of each element of xs paired with the number of times it occurs. i.e
   occurrences [5,2,3,2,4,3,2,5] ~> [(5,2), (2,3), (3,2), (4,1)]

Don't restrict yourself to a single function definition -- consider using 
auxiliary functions to break the task into simpler subtasks.

There will be two versions:
    occurrences3 
      version will use explicit recursion and function application only.
      This version should be decomposed using nested functions.


    occurences4
      version will use list comprehensions as much as possible.
      This can be done using 1 or 2 lines.


Problem 5. (One line wonder is possible)
Using the ideas presented in computing the nth Fibonacci
number with infinite list structures 
(http://bingweb.binghamton.edu/~head/CS471/NOTES/HASKELL/4hF02.html#Fib) 
define 
   > runningProduct list

   which calculates a running product, i.e.
   [ a0, a0 * a1, a0 * a1 * a2, ...

   from a list, [a0, a1, a2, ...

   ...> runningProduct [1 ..10]
   [1,2,6,24,120,720,5040,40320,362880,3628800]
   (332 reductions, 647 cells)


Problem 6: 
(Not too hard)
Define remv to remove every other element from a list.  Use list comprehenstion notation
 in your solution.

  Haskell3F03> remv [1 ..20]
  [1,3,5,7,9,11,13,15,17,19]
  Haskell3F03> remv "abcdefghihklmeno"
  "acegikmn"


> remv lst = ?


Problem 7:
Repeat problem 1.  Except each element will be repeat the number of times equal 
to it's position in the list.  

   Haskell3F03SOL> repeatE  "abcde"
   "abbcccddddeeeee"
   Haskell3F03SOL> repeatE  [1,3,65,3,2,1,2]
   [1,3,3,65,65,65,3,3,3,3,2,2,2,2,2,1,1,1,1,1,1,2,2,2,2,2,2,2]


Problem 8. 
Define a function that computes the value of e^x using the series expansion

       e^x = 1 + x + (x^2 / 2!) + ( x^3 / 3!) + ... + ( x^n / n!) + ...

  You may or may not find use for
  the below functions:
       powersOf and fact; 
  and the Prelude function: 
       sum, zip, zipWith, and takeWhile;
  in your definitions.  You can  use "where clause" to
  promote readability of your code. Your solution should discard all 
  terms of the series smaller than 0.000001.  


> powersOf x = iterate (\n -> n * x) 1.0

> fact = 1:zipWith (*) [1.0 ..] fact

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



Problem 9: Thompson 10.3
  Define a function composeList which composes a list of functions 
  into a single function.
  What is the effect of your function on an empty list of functions?
  This can be done as a one line wonder using HOF. 
  You may use any technique.   
  
 
    Haskell3F03> composeList [ (*) 2, (*) 2] 2
    8
   (26 reductions, 32 cells)
    Haskell3F03> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
    -21
    (32 reductions, 41 cells
    Haskell3F03>  composeListHOF [ (-) 3 , (*) 2, (+)5 ] 7
    -21
     (32 reductions, 41 cells)
    Haskell3F03>  composeListHOF2 [ (-) 3 , (*) 2, (+)5 ] 7
    -21
    (33 reductions, 46 cells)


> composeList [] = id
> composeList (h:t) =  ?


> composeListHOF  = ?





Problem 10. (easy)
Use the HOF, map, and lambda expressions to square the values of a list.
       ...> sqLst [1,2,3]
            [1,4,9]
CODE:


> sqLst  =  ?



Problem 11:
convertToDigit takes a string of digits and returns a list of Integers.
   Define it using HOF(fold and/or map) and any other needed functions.
   (One line wonder)

   ...> convertToDigit "01239875" 
   [0,1,2,3,9,8,7,5]
   (109 reductions, 236 cells)  





Problem 12:  (List comprehension)

(Only use list comprehension notation.)
(From Thompson 17.23)  Give a definition of the function

    factors :: Integral -> [Integral]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]




Problem 13. easy 
Using HOF (map, fold and/or filter) define addTuples that each pair in a list.
 
   Haskell3F03> addTuples [(1,2), (3,4), (11,21)]
   [3,7,32]
   (64 reductions, 97 cells)



Problem 14. 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells




Problem 15: (Thompson 10.13)
  Find functions f1 and f2 so that
 
   s8 =  map f1 . filter f2

  has the same effect as
 

> p8 = filter (>0) . map (+1)

 
  Haskell3F03> p8 [-4,4, -3,3,12,-12]
  [5,4,13]
  (99 reductions, 153 cells)
  Haskell3F03> s8 [-4,4, -3,3,12,-12]
  [5,4,13]
  (90 reductions, 137 cells)
  Haskell3F03> p8 [1, 0, -1, 3, -3]
  [2,1,4]
  (109 reductions, 155 cells)
  Haskell3F03> s8 [1, 0, -1, 3, -3]
  [2,1,4]






