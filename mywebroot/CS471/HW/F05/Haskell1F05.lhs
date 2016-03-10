> module Haskell1F05
>     where

Purpose:  Introduce Haskell 
            by programming
               simple recursive functions
               simple function application
               curried functions (partially evaluated functions)
            by examining types
               experience type inferences
               develope a curious about the "most General types"
               an appreciation of functions as first class types

            and to experience the literal style of programming.

          You do not need to use modules on this assignment.

Note: In the homework file put only one space between ">" and the code.  
The examples above use more than one space.  
Do not use a tab...  JUST one SPACE.

 A) Looking in around ...  experiments. Not to be handed in!
     (After opening hugs you will get a prompt 
      Prelude><your type here if you clicked on .lhs file> )
      a) What does ...> :? <return> do?
      b) What does :t isAscii <return> do?
             A :t head <return> ??
             B :t (:) <return> ??
             C :t []
  B) Continue to examine, via your text editor, 
     the Prelude.hs file that comes with your hugs. 
     What is the purpose of the file? 
     What is the most interesting function you find?  
     Do not turn in ... be prepared to discuss in class.  
     (Prelude.hs is in the lib directory.  Use a text editor to view.
      OR you can view http://haskell.org/onlinereport/prelude-index.html)
  C) Try on the command line 
   (You do not need to understand why everything works below.)
                 
      ...> fst (3 ,4)
      ...> max 9 5
      ...> snd (3,4)
      ...> [1 .. 12]
      ...> ['a' .. 'z']
      ...> splitAt 4 "asdbefg"
      ...> [ y*2 | y <- [2,4 .. 10]]
      ...> :t 1
      ...> :t [1,2,3]
      ...> :t (+)
      ...> :t "abc"
      ...> :t ['a','b']
      ...> :t "abc" ++ "abc"
      ...> :t div
      ...> div 6 4
      ...> [ 1 ..]  

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

YOUR NAME, EMAIL
Assignment Haskell1F05.lhs

Problem 1: (easy) (Thompson 4.1) This question is about the function
   maxFour :: Int -> Int -> Int -> Int -> Int 
which returns the maximum of four integers.  Give three definitions of this 
function: the first definition(maxFour1) should use && and >=  , 
the second (maxFour2) should be modelled on that of maxThree,

> maxThree x y z  = max (max x y ) z

the third (maxFour3) should use the functions max and maxThree.

Code to follow this line.  Remember you must begin the code with ">"



  What is the derived type (signature) of maxThree?
  Write answer here.




Problem 2: (easy)

Rewrite problem maxThree1 except you will apply the function to a tuple 
To execute type:
   Haskell1F05> maxThree1 (25, 75, 15)
   75
  What is the derived type (signature) of maxThree1?
To execute you would type:
    Haskell1F05> maxThree1 (3,4,1)
    4





Problem 3:  
Use Newton's method to compute the square root of n.  (See problem 2 in the written part). 

To execute you would type:
   Haskell1F05> newton 25 1 0.00000000001
   5.0
   Haskell1F05> newton 25 1 0.0001
   5.00000000005372    
   
25 is the number. The guess is 1.0. The decimal is "near", which is 
used to test if the next guess is not much of a change.  If the new guess 
is "near" the guess terminate the recursion and return the new guess.

 



Problem 4: (easy)
Define a data type Point that represents a point in a plane and 
the coordinate values should be Double.  

a) Define a function "isOrigin" that returns true if the point is the origin 
and false otherwise.  If the constructor for your Point is Pt then 
to execute you type:

    Haskell1F05> isOrigin (Pt 0.0 0.0)
    True  
    Haskell1F05> isOrigin (Pt 3.0 0.0)
    False     

Try to predict the type of isOrigin then check your answer.  


> data Point  = Pt Double Double
 

b) Redefine isOrigin (call it isOriginL) using lambda expression only.  


Problem 5:(easy)


   The function "implies"  takes tow Boolean arguments and returns a
   Boolean Result.  

   Its truth table is:


      x       y         implies x y

      True    True         True
      True    False        False
      False   True         True
      False   False        True

   Define implies three ways:

   a. Using conditional expression (if..then...else)
Code:
 
> impliesC :: Bool -> Bool -> Bool



   b. Using guards
  
Code:
 
> impliesG :: Bool -> Bool -> Bool



    c. Using a single Boolean expression 
       Boolean operatores are:not, &&, ||

Code:
 
> impliesE :: Bool -> Bool -> Bool




Problem 6: (easy)
The written part of this assignment you had following problem:
   f(x) = 2x - 5
   g(x) = 3x - 2

   1. What is the function composition,  (f o g) (x ) = ?
 
   2. What is  (g o f) (x ) = ?

   3. What is the value of  (f o g) (2 ) = ?

   4. What is the value of (g o f ) (2 ) = ?

 a) Write the Haskell definition of f and g as described above using 
    LAMBDA Expressions.  

 b) Write the Haskell definition for "composegf" so that it computes (g o f),

You should use the "." compose operator.

NOTICE: that composefg and composegf do NOT have arguments. Does
the code produces same results calculated on the written part?

 What are the types of f, g, composefg, composegf?

7) Code problem 1.3 page 30 from Louden using Haskell

problem 8:
Redefine the following functions

> evenE, oddE :: Int -> Bool
> evenE n = if n==0 then True else oddE (n-1)
> oddE n = if n==0 then False else evenE (n-1)


  a. using guards only.  (rename evenG and oddG)
  b. using patterns as much as possible, 
        and guards where patterns can't be used. (Rename evenP and oddP)
  


