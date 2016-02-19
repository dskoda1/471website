4/16 10:30
Don't forget to rename file as defined in the instructions. You do not
have include above the "+++++" line in your hard copy.

Purpose:  Re-enforce programming recursive functions,
          experience functions as first class citizens,           
          practice with lambda expressions
          and using List Comprehension

Notes:
     Below you will see some sample output with reductions.  
     You can set Hugs to show your reductions by 

     ...>:set +s

     There are stubs for your code and type declarations in this file
     THEREFORE when you load this present file into HUGS.     


From the Gentle Introduction to Haskell:
   (Recall that ":" associates to the right.) 
   Note that x:xs appears both as a pattern on the left-hand side, and an
   expression on the right-hand side. To improve readability, we might 
   prefer to write x:xs just once, which we can achieve using an 
   as-pattern as follows: (Another advantage to doing this is that a 
   naive implementation might completely reconstruct x:xs rather than 
   re-use the value being matched against.) 
   i.e.
   f s@(x:xs)             = x:s  

   (Can you figure out what f does above?)


Practice:  DO NOT turn in.
What does 

   ...> sum[9,2,3]
do?

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
YOUR NAME, EMAIL

> module HaskellS022
>     where


1a) Write a definition for flippy, which applies the last value 
     (which is a function) 
to the reverse of the first two values.
This is very EASY.  ONE LINE!!  

  ...> flippy 10 7 (-)
  -3
  (14 reductions, 17 cells)
  ...> flippy 7 10 (-)
  3
  (14 reductions, 16 cells)
  ...> flippy "abc" "ZYX" (++)
  "ZYXabc"
  (18 reductions, 44 cells)
  ...> flippy 3 "abcdef" (!!)
  'd'
  (78 reductions, 141 cells)


> flippy x y z = 


1b) What is the type of flippy?


Problem 2: Easy
   Rewrite problem 1 using a lambda expression.
   NOTE: there are NO arguments

> flippyL = 


2b) What is the type of flippyL?


Problem 3: Easy
    Write a Haskell script zipT L1 L2 L3, which returns a list of pairs.
    Haskell provides pattern matching and list operators so the lefthand 
    side of function will be
        zipT (h:t) (n:ns) (l:ls)
    (h:t) h matches the head of the list and t matches the tail --
    like prolog.  Use primitive recursion.
    
    ...> zipT [1,2,3] ['a','b','c','d'] ['X', 'Y']
    [(1,'a','X'), (2,'b','Y')]
    CODE:

                                                     

3b) What is the signature of zipT?


Problem 4:  Easy
   Using the the data type Triple provided below,  
   write a Haskell script zipTType lst1 lst2, which 
   returns a list of Triples.

    ....> zipTType [1,2,3] "abcde" [3.4, 9.3]
    [Triple 1 'a' 3.4,Triple 2 'b' 9.3]



> data Triple a b c = Triple a b c  deriving Show



4b)  What is the signature of zipTType?


Problem 5:
  (See html for details)
  Horner's rule is an algorithm to evaluate a polynomial without 
  requiring the computation of arbitrary powers of x. 
  We can represent the coefficients of a polynomial 
     an x^n + an-1 x^(n-1) +...+ a0 using a 
     coef = [a0, a1, ...,  an ].

Write a haskell script that will evaluate a polynomial.  You may use
List comprehension notation and function application as part of your solution. 
DO NOT USE Primitive RECURSION.  USE LIST COMPREHENSION.  Use the ideas from 
the circular list structure as a solution for a fibSeq. 
http://bingweb.binghamton.edu/~head/CS471/NOTES/HASKELL/4hSpr02.html
This will solve the problem but does not use Horner's algorithm.

> calcPoly coef x = sum [a * x ^ e  | (a, e) <- zip coef [0..]] 


I have done it with recursion and list comprehension.  See what you come up
with.

John Meeks solved it using circular lists.
He had to reverse the order of the coefficients to get a solution.

i.e. use coef = [an, an-1, ... a1, a0]



Problem 6:
Define a function occurrence so that 
           occurrence xs
returns a list containing one copy of each element of xs paired
with the number of times it occurs.  
      ...> occurrence [5,2,3,2,4,3,2,5]
      [(5,2),(2,3),(3,2),(4,1)]
      (213 reductions, 446 cells)
      ...> occurrence [1,2,3,4,5,4,3,3,2,5,2,3]
      [(1,1),(2,3),(3,4),(4,2),(5,2)]
      (345 reductions, 734 cells)
      

Don't restrict yourself to a single function definition.  Consider
using nested definitions to break the task into simpler subtasks. 
You should be doing recursion for this problem.
 

CODE::




Problem 7:
   Write a script that returns the average of a list of Integrals.  Use only
   function application not primitive recursion.  You will need to understand
   how Haskell handles numbers.  This is a one line wonder!
   Remember from HW 1 

> lF :: [a] -> Float
> lF = (\x -> encodeFloat ((toInteger . length) x) 0)


CODE::  




Problem 8:
   Write a script that returns the running average of a list of numbers (nums)

   ...> runningAver [4,3,2,1]
   [2.5,2,1.5,1.0]

   This is just two lines of code.   
   
CODE:  





Problem 9: (Use list comprehension notation.)
(From Thompson 17.23)  Give a definition of the function

    factor :: Integral -> [Integral]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]
There are many different solutions possible. I have 3 solutions each only one line of code.





Problem 10: (Use list comprehension notation in your solution)

Define the list of numbers whose only prime factors are 2,3, and 5 , the
so-called Hamming numbers:

hamming = [1,2,3,4,5,6,8,9,10,12,15, ...






Problem 11: Using list comprehension 
Define a function occurrence so that 
           occurrenceLC xs
returns a list containing one copy of each element of xs paired
with the number of times it occurs.  
      ...> occurrenceLC [5,2,3,2,4,3,2,5]
      [(5,2),(2,3),(3,2),(4,1)]
      (213 reductions, 446 cells)
      ...> occurrenceLC [1,2,3,4,5,4,3,3,2,5,2,3]
      [(1,1),(2,3),(3,4),(4,2),(5,2)]
      (345 reductions, 734 cells)
THIS is a two line wonder and I will give the first line.


> occurrenceLC [] = []





