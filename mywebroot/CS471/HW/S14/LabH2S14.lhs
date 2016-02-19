> module LabH2S14
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





problem 1&2:
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

  2b:
  Convert the algorithm used in turboPower to tail recursive form. Call the
  definition turboPowerT.



Part 4 -  List Comprehension 

Problem 1: Define sq, which creates a list of square values from a list of 
numbers.  Use list comprehension notations in your solution. (Very easy)



Problem 2:
Define a function "repl" which given a list of numbers returns a 
list with each number duplicated its value.  Use only list comprehension
notation in your solution. (a little tricky) i.e.
  ..> repl [5,1,3,2,8,1,2]
  [5,5,5,5,5,1,3,3,3,2,2,8,8,8,8,8,8,8,8,1,2,2]


Part 5:


Problem 2: Implement Newton's method for calculating the square root of N. Your
definition should use primitive recursive style.
Your definition should include a user defined (input) "guess" value and a
user defined "nearEnough" value.  "nearEnough" is use to determine
when the guess is close enough to the square root.  (guess*guess = number)

e.g. 
   Lab7S14> newtonAppr 144 1 0.1             
   12.000545730742438 
   Lab7S14> newtonAppr 144 1 0.0001
   12.0000000124087
   Lab7S14> newtonAppr 144 1 0.000000000000001
   12.0
   Lab7S14> newtonAppr 5e+30 1 1000000000000000000000000000000  
   2.317148867384728e15
   Lab7S14> newtonAppr 5e+30 1 100000000000000000000000000    
   2.2360684271923805e15



 Problem 3: Thompson 10.3
  Define a function composeList which composes a list of functions 
  into a single function.
  What is the effect of your function on an empty list of functions?
  Define composeList using primitive recursion.
  
 
    ...> composeList [ (*) 2, (*) 2] 2
    8
   (26 reductions, 32 cells)
    ...> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
    -21
    (32 reductions, 41 cells
    ...>  composeListHOF [ (-) 3 , (*) 2, (+)5 ] 7
    -21
     (32 reductions, 41 cells)

         
Problem 4:  (List comprehension)

(Only use list comprehension notation.)
(From Thompson 17.23)  Give a definition of the function

    factor :: Integral -> [Integral]

which returns a list containing the factors of a positive integer.  For instance

    factor 12 = [1,2,3,4,6,12]



