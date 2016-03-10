> module Haskell4S07
>     where

Due in Monday's class

1)  What is the type of divMod?  What does divMod do?
2)  Define a function digit:: Integer -> [Integer]. digits returns a list   
    of digits of a number. Use explicit recursion style to code this problem.
eg:
  ... >digit 180910
  [1,8,0,9,1,0]
  
2) What is the type of the built in function "sum"?

Due in Wed's class
1) What is the type of mys? Describe what mys does?

> mys (x:xs) = (x:takeWhile (x<) xs, x:dropWhile (x<) xs)



Due in  Friday's class
  What is the most general type (if any) of
   A) (.) head head
   B) map map
   C) foldl foldl
   D) map foldl
   E) map . foldl

____________________________________________________

Problem 1: Define sq, which creates a list of square values from a list of 
numbers.  Use list comprehension notations in your solution. (Very easy)


Problem 2: Define the function flat:: [[a]]->[a], which takes a lists of lists, 
ass,  and returns a list of with all the list in ass concatenated. This is a one
line wonder. Your solution should use list comprehension notation. 
Example:
  ...> flat ["asdf","xyz","azbx","1234","+*"]
  "asdfxyzazbx1234+*"
  ...> flat [[1,2],[99],[33,2,1]]
  [1,2,99,33,2,1]



Problem 3:
Define a function "replicate1 :: (Enum a, Num a) => [a] -> [a]"  which given a 
list of numbers returns a list with each number duplicated its value.  Use only 
list comprehension notation in your solution.  i.e.
 
  ..> replicate1 [5,1,3,2,8,1,2]
  [5,5,5,5,5,1,3,3,3,2,2,8,8,8,8,8,8,8,8,1,2,2]



Problem 4:
" A happy number is any number that eventually reduces to 1 when the following 
process is used: take the sum of the squares of its digits, and continue 
iterating this process until it yields 1, or produces an infinite loop. Numbers
that are not happy are called unhappy numbers. A computer search up to 1020 
suggests that about 12% of numbers are happy, though no proof is known. 

For example, 7 is happy, as the associated sequence is:

    7^2 = 49
    4^2 + 9^2 = 97
    9^2 + 7^2 = 130
    1^2 + 3^2 + 0^2 = 10
    1^2 + 0^2 = 1 "
    
(from http://en.wikipedia.org/wiki/Happy_number)

Define a function happy:: Integer -> [Integer], which generates a list
with a sequence of numbers as described above.  "happy" will terminate only if
the input is a "happy" number otherwise it will go into an infinite loop
It can be coded in one line using sum, sq and digit.  (You may use explicit
recursion.)
e.g.
  Haskell4S07> happy 7
  [7,49,97,130,10,1]
  Haskell4S07> happy 17
 [17,50,25,29,85,89,145,42,20,4,16,37,58,89,145,42,20,4,16,...




Problem 5) Recode the following explicit recursive definition using 
           function application of fold (either foldr or foldl)

> composeList1 [] = id
> composeList1 (h:t) = h . composeList1 t

Here is a sample execution:
Haskell4S07> composeList1 [(3*),(100+),(2*)] 3
318



Problem 6: Write new definitions of this function:

> f = \xs -> [ x *2 | x <- xs, x > -5 ]
 
6a. Redefine using explicit recursion. Use the name 
    fr for your new definition. 


6b. Redefine using  higher-order functions(map, fold and/or filter) 
    (NO explicit recursion). Use the name fHOF for your new definition. 



Problem 7:

  mem :: (Eq a) => a -> [a] -> Bool

is a function such that (mem x xs) returns True if x occurs in
the list xs and returns False otherwise.  
7a: Give a Haskell program for mem by filling in the blanks below:
 
-- mem x xs = foldr f ___________ xs
--        where f y r = ____________________________





7b: Give a Haskell program for filter by by filling in the blanks below.
--
--    filter p xs = foldr f [] xs
--     where f y r 
--          | _________ = __________
--          | otherwise = __________

-- 





Problem 8: (Thompson 10.13)
  Find functions f1 and f2 so that
 
   s8 =  map f1 . filter f2

  has the same effect as
 

> p8 = filter (>0) . map (+1)

 
  Haskell2S07> p8 [-4,4, -3,3,12,-12]
  [5,4,13]
  (99 reductions, 153 cells)
  Haskell2S07> s8 [-4,4, -3,3,12,-12]
  [5,4,13]
  (90 reductions, 137 cells)

_________________________


Problem 9: 
Using higher order functions (map, fold or filter) and if necessary lambda
expressions. Write a definition for f1 and f2 so the following evaluation 
is valid:  (hint: a lambda expressions could be useful).

     f1 (f2 (*) [1,2,3,4]) 5  ~> [5,10,15,20]

     Main> f1 ( f2 (*) [1,2,3,4]) 5
     [5,10,15,20]
     (77 reductions, 123 cells



Problem 10:  Define a function "bucket:: Eq a => [a] -> [[a]]"
which consumes a list of numbers and produces a list of lists of numbers. These 
lists should group consecutive numbers of the input.
  Example: 
   Haskell4S07> bucket [3,2,2,2,2,7,7,7,1,1,1,2,3,3,3,5]
   [[3],[2,2,2,2],[7,7,7],[1,1,1],[2],[3,3,3],[5]]

You may use takeWhile and dropWhile to solve this problem.  Extra credit if
you use foldr to solve this problem.  



