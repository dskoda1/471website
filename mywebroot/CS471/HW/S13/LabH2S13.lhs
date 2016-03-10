> module LabH2S13
>     where

Part 1 Data type



Part 2 Recursion:

Problem 1: Write a recursive definition, mul x y, that returns the product x*y. (Do
not use "*" operator.



Problem 2: Implement Ackermann's function

Problem 3: 
The harmonic series is the following infinite series:
                            1   1   1   1               1
                      1 +   - + - + - + - + ...   + ... - ..
                            2   3   4   5               i
(http://en.wikipedia.org/wiki/Harmonic_series_(mathematics))
Write a function sumHarmonic such that sumHarmonic i is the sum of the first i
terms of this series. For example, sumHarmonic 4 ~> 1 + 1 + 1 + 1 ~> 2.08333...
                                                        2   3   4


Part 3: Tail Recursion
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



Problem 2:
Define a function "repl" which given a list of numbers returns a 
list with each number duplicated its value.  Use only list comprehension
notation in your solution.  i.e.
  ..> repl [5,1,3,2,8,1,2]
  [5,5,5,5,5,1,3,3,3,2,2,8,8,8,8,8,8,8,8,1,2,2]



