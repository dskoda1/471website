> module Haskell2S11 
>  where

Problem 1: Write new definitions of this function:

> f = \xs -> [ x + 5 | x <- xs, x > -1 ]
  
   ...> f [1,20,-3,15,2]
   [6,25,20,7]

   using higher-order functions, function composition, lambda expressions and
   function application (NO explicit recursion).(i.e. fHOF = ???) 
   (i.e. > fHOF = ???)




Problem 2:
Define a function replicate which given a list of numbers returns a 
list with each number duplicated its value. Use  this problem using a fold, map 
-- I also used a lambda expression, (++) and a take.  Only restrictions is you 
should use HOF, no recursion and no list comprehension.

Here is a possible solution using list comprehension.

> replicate' lst = [n | n<-lst, c<-[1..n]]

     ...> replicate' [3,4,2,5,1,6]
     [3,3,3,4,4,4,4,2,2,5,5,5,5,5,1,6,6,6,6,6,6]
     (0.00 secs, 1049676 bytes)


Problem 3:  (List comprehension)

(Only use list comprehension notation.)
(From Thompson 17.23)  Give a definition of the function

    factor :: Integral -> [Integral]

which returns a list containg the factors of a positive integer.  For instance

    factors 12 = [1,2,3,4,6,12]




Problem 4:    (Thompson 17.25 )
Define the list of numbers, hamming, whose only prime factors are 2, 3, and 5 , 
the so-called Hamming numbers. e.g.
   Haskell2S11> take 20 hamming
   [1,2,3,4,5,6,8,9,10,12,15,16,18,20,24,25,27,30,32,36]

You may also consider using factors but is not required. 
        You may consider using any combinition of the following techiques
        to express your solution::
               list comprehension notation, 
        and/or HOF 
        and/or explicit recursion, 
        and/or local definitions  



Problem 5&6: Below is a recursive definition for the harmonic series.
The harmonic series is the following infinite series:
                            1   1   1   1               1
                      1 +   - + - + - + - + ...   + ... - ..
                            2   3   4   5               i
(http://en.wikipedia.org/wiki/Harmonic_series_(mathematics))
Write a function sumHarmonic such that sumHarmonic i is the sum of the first i
terms of this series. For example, sumHarmonic 4 ~> 1 + 1 + 1 + 1 ~> 2.08333...
                                                        2   3   4

> sumHarmonic :: Fractional a => a -> a
> sumHarmonic 1 = 1
> sumHarmonic i = 1/i + sumHarmonic (i-1)


5) sumHR::[Double] -> Double, is a redefinition of Harmonic series
   using foldr. (i.e. figure out what ??? should be)  You may use a 
   nested function or a lambda expression.  If you are really creative
   you can define sumHR with the type sumHR :: Double -> Double
 
  > sumHR = foldr ??? 0
  
  
6) Rewrite the definition using foldl. (i.e. figure out what ???
should be)  You may use a nested function or a lambda expression.  
 
  sumHL = foldl ??? 0
  
   ...> sumHarmonic 20
   3.59773965714368
   ...> sumH [1..20]
   3.59773965714368


Problem 7. 
Define a function that computes the value of e^x using the series expansion

       e^x = 1 + x + (x^2 / 2!) + ( x^3 / 3!) + ... + ( x^n / n!) + ...

  You may or may not find use for
  the below functions:
       powersOf and fact; 
  and the Prelude function: 
       sum, zip, zipWith, and takeWhile;
  in your definitions.  You can use "where clause" to
  promote readability of your code. Your solution should discard all 
  terms of the series smaller than 0.000001.  



> powersOf x = iterate (\n -> n * x) 1.0

> fact = 1:zipWith (*) [1.0 ..] fact



I have implemented few different solutions.  
Here are my times and memory usage.

    ...> eToX 3.5
    33.115450772244024
    (0.01 secs, 3806744 bytes)
    
    ...> e2X 3.5
    33.11544578238543
    (0.00 secs, 526656 bytes)

    ...> eToX 5.1
    164.02190637911082
    (0.00 secs, 1050348 bytes)

    ...> e2X 5.1
    164.02190309984002
    (0.00 secs, 526680 bytes)
    
    ...> e3X 3.5
    33.11544578238543
    (0.00 secs, 524368 bytes)
 
 
 I used iterate in e2x2GC and it was the fastest solution.
    
    ...> e2x2GC 3.5
    33.115450772244024
    (0.00 secs, 0 bytes)
    
    ...> e2x2GC 5.1
    164.02190637911082
    (0.00 secs, 526368 bytes)

    

