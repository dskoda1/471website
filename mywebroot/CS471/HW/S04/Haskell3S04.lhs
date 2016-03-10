> module Haskell3S04
> where
> import List


YOUR NAME, EMAIL


Purpose:  To practice the abstraction using Higher order function.
          Some more experience with list comprehension notation.
          Practice with number types.
          
Practice and experimenting:
You can switch off the requirement of using "show" in the display by
   > :s -u
and turning it on
   > :s +u

Remember you can orint no. reductions/cells after eval by setting "s"
   :s +s

What is the type of
   uncurry
What does it do?

What is the value of
   uncurry (+)

Keep working figuring out the inferred type:

What is the most general type (if any) of
   A) map map
   B) foldl foldl
   C) map foldl
   D) map . foldl

What is the value of :
   (map . foldl1) (-) [[1,2,3],[3,2,1],[100,200,300]]
    map (\v ->  v [4000,1000]) (map foldr1 [div,(-)])
    map (\f -> f [3,4,5])  (map map [(*) 3,(-) 4])



++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Problem 1. The following is a simple definition of average 
of a non-empty list is :

> average :: [Integer] -> Double
> average ns = fromInteger  (sum ns) / (fromInteger . toInteger) ( length ns )


This code takes two passes over ns.  Define a more efficient implementation of
average which makes a single pass.  Defining a nested function with type
    sumAndLength :: [Int] -> (Int,Int)
which in one pass over ns the sum of the list and the length. sumAndLength will
be defined using primitive recursion.


 > averageFast :: [Integer] -> Double
 > averageFast ns = ?




Problem 2:
Below is a way to generate an infinite list of 2^n values.

> powersOf2 = iterate (\n -> n * 2) 1.0

Write a one line of code using circular list style.  You may use list
comprension notation.

 > powersOf2CL = ?


Problem 3:
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




Problem 4:

(Only use list comprehension notation.)
(From Thompson 17.23)  Give a definition of the function

    factor :: Integer -> [Integer]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]







Problem 5: (Use HOFs NOT list comprehension.  You may consider
using local definitions.You may also consider using factors but is not
required.  Thompson 17.25 )

Define the list of numbers whose only prime factors are a, b, and c , the
so-called Hamming numbers:

   Haskell3S04SOL> hamming 3 5 7
   1,3,5,7,9,15,21,25,27,35 ...



> hamming :: Integer -> Integer -> Integer -> [Integer]
> hamming a b c = ?


problem 6:  One line wonder. 

Using map, filter, . (compose), ++, == and head
 define 
   listOfWds firstChar lstOfWds
that given a list of words, lstOfWds, and a character, firstChar, returns a list
of only the words that begin with firstChar .

    ...> listOfWds 't' ["the","only","two","only","words","are","'the and two'"]
    " the two"
    (208 reductions, 281 cells)

   . ..> listOfWds2 't' ["the","only","two","only","words","are"," 'the and two' ","but","there","are", "three","more" ,"too"]
     " the two there three too"
     (557 reductions, 771 cells)

 ( note: This illustrates that "'" is a character.

    concat ["the","only","two","only","words","are","'the and two'"]                                                                                
    "theonlytwoonlywordsare'the and two'"
    (695 reductions, 984 cells)
 )




Problem 7 & 8:
Define a functions occurrences so that "occurrences" xs 
    returns a list containing 
  one copy of each element of xs paired with the number of times it occurs. i.e
   occurrences [5,2,3,2,4,3,2,5] ~> [(5,2), (2,3), (3,2), (4,1)]

Don't restrict yourself to a single function definition -- consider using 
auxiliary functions to break the task into simpler subtasks.

There will be two versions:
    occurrences7
      version will use explicit recursion and function application only.
    occurences8
      version will use list comprehensions as much as possible.




problem 9:
Given a list of the binomial coefficient for the nth number calculate 
a list of binomial coefficient for the nth + number. You may use any style.
      binCoef :: (Num a) => [a] -> [a]
     (http://mathforum.org/dr.math/faq/faq.pascal.triangle.html)

Basically we are given the "nth" row in the pascal triangle and 
we want to calculate the next row.
      (http://mathforum.org/library/drmath/view/57243.html)
You can use a locally recursively defined function in your definition.  
  ...> binCoef [1,2,1]
  [1,3,3,1]
  (30 reductions, 66 cells)
  ...> binCoef (binCoef (binCoef [1,3,3,1]) )
  [1,6,15,20,15,6,1]
  (74 reductions, 192 cells)

  ...> (binCoef . binCoef . binCoef) [1,2,1]
  [1,5,10,10,5,1]
  (63 reductions, 157 cells)

