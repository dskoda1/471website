> module LabH2F13
>    where

Part 1:  Data types

 Problem  1:  Point
 
 
 Problem  2: inside
 
 
 Part 2 Recursion:
       
 Problem 1: define mul x y
 
 
  
Problem 2:  Write a Haskell script which implements Ackermann's function as defined in 
homework 1 problem 6.  Name your script "ack".  
You may use guards, and/or pattern matching and/or if expressions in
your definition.  Predict the inferred type of ack.  Check you guess.


Problem 3: 
Implement Newton's method for calculating the square root of N. 
Your definition should include a user defined (input) "guess" value and a
user defined "nearEnough" value.  "nearEnough" is use to determine
when the guess is close enough to the square root.  (guess*guess = number)

e.g. 
   LabH2F13> newtonAppr 144 1 0.1             
   12.000545730742438 
   LabH2F13> newtonAppr 144 1 0.0001
   12.0000000124087
   LabH2F13> newtonAppr 144 1 0.000000000000001
   12.0
   LabH2F13> newtonAppr 5e+30 1 1000000000000000000000000000000  
   2.317148867384728e15
   LabH2F13> newtonAppr 5e+30 1 100000000000000000000000000    
   2.2360684271923805e15




Problem 4:  Define sumHarmonic using a simple recursive style:

The harmonic series is the following infinite series:
                            1   1   1   1               1
                      1 +   - + - + - + - + ...   + ... - ..
                            2   3   4   5               i
(http://en.wikipedia.org/wiki/Harmonic_series_(mathematics))
Write a function sumHarmonic such that sumHarmonic i is the sum of the first i
terms of this series. For example, sumHarmonic 4 ~> 1 + 1 + 1 + 1 ~> 2.08333...
                                                        2   3   4
sumHarmonic has type  Fractional a => a -> a.

Problem 5: Thompson 10.3
  Define a primitive recursive function composeList which composes 
  a list of functions into a single function.
  What is the effect of your function on an empty list of functions?
  Rewrite this using only function(HOF) application(THIS WILL BE IN THE  
  HOMEWORK NOT FOR THIS LAB).
  
    (Note I have -- :s +s)  
    Haskell1F13> composeList [ (*) 2, (*) 2] 2
    8
   (0.01 secs, 2666676 bytes)
   *LabH2F13> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
   -21
   (0.00 secs, 2879264 bytes)
  
(In GHCi Not HUGS)
    *Haskell1F13> let c = composeList [ (+)5 , \x -> x*x - x*2]
    (0.00 secs, 0 bytes)
    *LabH2F13> c 10
    85
    (0.00 secs, 0 bytes)
 (In Hugs)
    LabH2F13> composeList [ (*) 2, (*) 2] 2
    8
   (26 reductions, 32 cells)
   
   
 

Part 2: Tail Recursion
problem 1&2:
Below is the code for the first 2 written questions.


problem 2&3:
Below is the code for the first 2 written questions.

> power :: Integer -> Integer -> Integer
> power a 0 = 1
> power a b = a * power a (b-1)

> powerT :: Integer -> Integer -> Integer
> powerT a b = trp b 1
>      where
>      trp n p = if (n==0) then p else trp (n-1) (a*p)

> turboPower :: Integer -> Integer -> Integer
> turboPower a 0 = 1
> turboPower a b
>     | even b = turboPower (a*a) (b `div` 2)
>     | otherwise = a * turboPower a (b-1)

  2c:
  Convert the algorithm used in turboPower to tail recursive form. Call the
  definition turboTPower.



Part 4 -  List Comprehension 

Problem 1: Define sq, which creates a list of square values from a list of 
numbers.  Use list comprehension notations in your solution. (Very easy)


Problem 2: repl
    
