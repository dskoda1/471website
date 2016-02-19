Purpose: review of functional programming concepts covered:
         function application
         function composition
         use of list comprehension notation
         use of map, fold and filter
         use of lambda expressions
         use of infinites in place of the use of loops in imperative languages


> module Haskell3F04 where
> import List



Problem 1:
The function determines if a String is a palindrome, i.e. the string and the
reverse of the string are the same.

Write a Haskell function in the following format:

   >   palindrome :: String -> Bool
   >   palindrome [] = ...
   >   palindrome [x] = ...
   >   palindrome x = ... -- uses head, last, init, tail and explicit recursion




Problem 2: Repeat problem 1,
           use the compose function as part of your recursive solution

       > palinC :: String -> Bool
       > palinC [] = 
       > palinC [x] =
       > palinC x =  uses the same functions in use in 1 plus "." compose



Problem 3:
Repeat problem 1
 use only boolean expression and built-in definitions, NO explicit recursion

 > palindrome1 :: String -> Bool
 > palindrome1 x = ???


Problem 4:
Write a Haskell function, palindromic.
The function determines if this list of strings is palindromic 
IN THE FOLLOWING SENSE: If you reverse the list AND, as you do that, 
                        you also reverse each string in the list, 
                        then that should be equal to the original list, e.g.
palindromic ["abc", "def", "ghg", "fed", "cba"] returns True
since the reverse of reversed strings is ["abc", "def", "ghg", "fed", "cba"] 

palindromic ["abc", "def", "ghig", "fed", "cba"] returns False
since the reverse of reversed strings is ["abc", "def", "gihg", "fed", "cba"] 

palindromic ["abc", "def", "ghg", "fred", "cba"] returns False
since the reverse of reversed strings is ["abc", "derf", "ghg", "fed", "cba"] 

You should return the value of a boolean expression if the list 
contains more than one element.  You should not be using HOF, 
list comprehension. The explicit recursion should be part of a boolean expression.   If there is only one element then your solution can return the value of palindrome applied to the element.


> palindromic :: [String] -> Bool

 > palindromic [] = 
 > palindromic [x] =
 > palindromic xs = 



Problem 5:
Repeat problem 4: Try using a combination of "reverse," "zipWith," and "and"

 > palindromic1 :: [String] -> Bool
 > palindromic1 x = ?






Problem 6:(1-line solution) Rewrite reverse.

  Here is the definition of "foldr" that is in 
  "C:\Program Files\Hugs98\lib\Prelude.hs"
  foldr f z []      = z
  foldr f z (x:xs)  = f x (foldr f z xs)

 Next, recall from "Higher Order Function" notes that  we can use the 
 notation "e1~>e2" to mean expression e1 evaluates to expression e2 
 when we want to explain how
 a function works step-by-step. For example, in this question we are looking 
 for a function "f" that would produce the following sequence of evaluations:

foldr f [] [1,2,3]
~> f 1 (foldr f [] [2,3])
~> f 1 (f 2 (foldr f [] [3]))
~> f 1 (f 2 (f 3 (foldr f [] [])))
~> f 1 (f 2 (f 3 []))
~> f 1 (f 2 [3])
~> f 1 [3,2]
~> [3,2,1]

 Now, Haskell has a function "reverse" that reverses the order of the 
 elements in a list, e.g. reverse [1,2,3,4] => [4,3,2,1]. The definition 
 in Prelude.hs consists of 
 foldl            :: (a -> b -> a) -> a -> [b] -> a
 foldl f z []      = z
 flip           :: (a -> b -> c) -> b -> a -> c
 flip f x y      = f y x
 foldl f z (x:xs)  = foldl f (f z x) xs
 reverse   :: [a] -> [a]
 reverse    = foldl (flip (:)) []

 Complete reverse1 by replacing YOURLAMBDAEXPRESS with a 
 lambda expression which will reverse a list.  You should _NOT_ use "flip"
 
 > reverse1 = foldr YOURLAMBDAEXPRESS []




Problem 7: Define a function occurence such that 
                occurrence xs
       returns a list containing one copy of each element of xs paired
       with the number of times it occurs.  
           ...>occurrence [5,2,3,2,4,3,2,5]
           [(5,2),(2,3),(3,2),(4,1)]
           (215 reductions, 465 cells)
           ....> occurrence "abchahabeme"
           [('a',3),('b',2),('c',1),('h',2),('e',2),('m',1)]  
           (415 reductions, 905 cells)

Use list comprehension notation as much as possible in your solution. 
(This is a one line wonder+ the emply list). 





Problem 8. (One line wonder is possible)
Using the ideas presented in computing the nth Fibonacci
number with infinite list structures 
(http://bingweb.binghamton.edu/~head/CS471/NOTES/HASKELL/4hSpr01.html#Fib) 
define 

   which calculates a running product, i.e.
   [ a0, a0 * a1, a0 * a1 * a2, ...

   from a list, [a0, a1, a2, ...

   ...> runningProduct [1 ..10]
   [1,2,6,24,120,720,5040,40320,362880,3628800]
   (332 reductions, 647 cells)
This can be done in one line or using a nested definition.


Problem 9.

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

> fact  = 1.0:[ n*f | (n,f) <- zip [1.. ] fact ]


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



Problem 10:  (List comprehension)

(Only use list comprehension notation.)
(From Thompson 17.23)  Give a definition of the function

    factor :: Integral -> [Integral]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]



Problem 11: You may also consider using factors but is not required. 
            You may consider using any combinition of the following techiques
            to express your solution
              list comprehension notation, or HOF or explicit recursion, or
xk
               local definitions  
            (Thompson 17.25 )

Define the list of numbers whose only prime factors are a, b, and c , the
so-called Hamming numbers:

   Haskell3S04SOL> hamming 3 5 7
   1,3,5,7,9,15,21,25,27,35 ...










