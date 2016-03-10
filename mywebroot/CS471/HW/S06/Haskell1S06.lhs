> module Haskell1S06
>     where


This assignment is not meant to be hard. You will be introduced to partically
evaluated functions, function composition, type inference, use of boolean expressions.

Problem 1a: Give the definition of a function 
              inOrder2Pair :: Int -> Int -> (Int, Int)
           which returns a pair with minimum and maximum of two numbers.
  e.g.
 
   Haskell1S06> inOrder2Pair 3 4
   (3,4)
   Haskell1S06> inOrder2Pair 100 9
   (9,100)





1b) If you don't specify the type of inOrder2Pair, Haskell will infer
the most general type.  What is the most general type?

1c) Using a partial evaluation of inOrder2Pair, give the definition orderWith100
       orderWith100 :: Int -> (Int, Int)
    which returns a pair with minimum and maximum of a number and 100. Since we
    are using the partial evaluation we do NOT need to include an argument for the
    definition.  
    (i.e. orderWith100 = ????  You fill in the ???)




Problem 2: A year y is a leap-year iff y is divisible by 400 or if it is 
      divisible by 4 and not divisible by 100. Define a function 
            isleap :: Int -> Bool 
      that takes a year y and tells us if y is a leap- year. For example, 
      1992 and 2000 are both leap-years; 1900 and 1901 are both not leap-years.



Problem 3:  
Use Newton's method to compute the square root of n.  (See problem 4 in the written part). 

To execute you would type:
   Haskell1S05> newton 25 1 0.00000000001
   5.0
   Haskell1S05> newton 25 1 0.0001
   5.00000000005372    
   
25 is the number. The guess is 1.0. The decimal is "near", which is 
used to test if the next guess is not much of a change.  If the new guess 
is "near" the guess terminate the recursion and return the new guess.





Problem 4: Write a function that implements the  Ackermann's functions as defined in
           Homework assignment 1.  What is the  "ackermann number" for your 
            version in Haskell? 


Problem 5: (easy) 

   The function "nand"  takes two Boolean arguments and returns a
   Boolean Result.  

   Its truth table is:


      x       y        	nand x y

      True    True      False
      True    False     True
      False   True      True
      False   False     True

   Define implies three ways:

   a. nand -- Using conditional expression (if..then...else)
Code:
 



   b. nandG -- Using guards
  
Code:
 



    c. nandE -- Using a single Boolean expression 
       Boolean operatores are:not, &&, ||

Code:
 




Problem 6: (easy)
The written part of this assignment you had following problem:
   f(x) = 3x  - 5
   g(x) = 2x +  1

   1. What is the function composition,  (f o g) (x ) = ?
 
   2. What is  (g o f) (x ) = ?

   3. What is the value of  (f o g) (2 ) = ?

   4. What is the value of (g o f ) (2 ) = ?

 a) Write the Haskell definition of f and g as described above using LAMBDA
Expressions.  
 b) Complete the definition for
      composefg 
   so that it computes (f o g)

 c) Complete the definition for
      composegf 
   so that it computes  (g o f ).  

You should use the "." compose operator.

NOTICE: that composefg and composegf do NOT have arguments. Does
the code produces same results calculated on the written part?




What are the types of f, g, composefg, composegf?



7: Program exercise 1.1 page 30 for positive and negative numbers. e.g.
       ...> numDigit 100
       3





