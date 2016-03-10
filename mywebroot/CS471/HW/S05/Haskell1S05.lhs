> module Haskell1S05
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
Assignment Haskell1.lhs

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
   Haskell1S05> maxThree1 (25, 75, 15)
   75
  What is the derived type (signature) of maxThree1?
To execute you would type:
    Haskell1S05> maxThree1 (3,4,1)
    4





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

 



Problem 4: (easy)
Define a data type Point that represents a point in a plane and 
the coordinate values should be Double.  

a) Define a function "isOrigin" that returns true if the point is the origin 
and false otherwise.  If the constructor for your Point is Pt then 
to execute you type:

    Haskell1S05> isOrigin (Pt 0.0 0.0)
    True  
    Haskell1S05> isOrigin (Pt 3.0 0.0)
    False     

Try to predict the type of isOrigin then check your answer.  


> data Point  = Pt Double Double
 

b) Redefine isOrigin (call it isOriginL) using lambda expression only.  


Problem 6:
This exercise concerns the formula for computing the area of triangle
given 3 Points (as in problem 6):
  
    length =  squareRoot ((x2 - x1)^2 + (y2 - y1)^2)
    area = squareRoot (s*(s-a)*(s-b)*(s-c))
           where a, b and c are the lengths of the sides of the triangle
           and s = (a+b+c)/2.0

Use the Prelude function sqrt.  Use local definition to make your code 
easy to read. 

  i.e.
    Haskell1S05> area (Pt 0.0 0.0) (Pt 1.0 0.0) (Pt 0.0 1.0)
    0.5
    Haskell1S05> area (Pt 1.0 1.0) (Pt 1.0 0.0) (Pt 0.0 1.0)
    0.5
    Haskell1S05> area (Pt 1.0 1.0) (Pt 1.0 0.5) (Pt 0.5 1.0)
    0.125


Problem 7: (easy) 

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




Problem 8: (easy)
The written part of this assignment you had following problem:
   f(x) = 3x - 2
   g(x) = 2x - 3

   1. What is the function composition,  (f o g) (x ) = ?
 
   2. What is  (g o f) (x ) = ?

   3. What is the value of  (f o g) (2 ) = ?

   4. What is the value of (g o f ) (2 ) = ?

 a) Write the Haskell definition of f and g as described above using 
    LAMBDA Expressions.  

 b )Write the Haskell definition for "composefg" so that it computes (f o g)

 c) Write the Haskell definition for "composegf" so that it computes (g o f),

You should use the "." compose operator.

NOTICE: that composefg and composegf do NOT have arguments. Does
the code produces same results calculated on the written part?

 What are the types of f, g, composefg, composegf?



problem 9:
Redefine the following functions

> evenE, oddE :: Int -> Bool
> evenE n = if n==0 then True else oddE (n-1)
> oddE n = if n==0 then False else evenE (n-1)


  a. using guards only.  (rename evenG and oddG)
  b. using patterns as much as possible, 
        and guards where patterns can't be used. (Rename evenP and oddP)
  


problem 10:
Below is the code for the first 2 written questions.

> power :: Integer -> Integer -> Integer
> power a 0 = 1
> power a b = a * power a (b-1)

> powerT :: Integer -> Integer -> Integer
> powerT a b = trp b 1
>      where
>      trp n p = if (n==0) then p else trp (n-1) (a*p)

> turboPower a 0 = 1
> turboPower a b
>     | even b = turboPower (a*a) (b `div` 2)
>     | otherwise = a * turboPower a (b-1)


  10a:
  Define powerS by modifing powerT to force the accumulator argument 
  to be evaluated prematurely, using the operator ($!) as illustrated in factS.
Answer:

> powerS :: Integer -> Integer -> Integer

  10b:
  Convert the algorithm used in turboPower to tail recursive form. Call the
  definition turboTPower.

> turboTPower :: Integer -> Integer -> Integer




Problem 11:
We define factors as follows:
factors m n is TRUE 
        if there exists some k in the range 2 <= k < n that divides n
Reformulating as a Recursive decomposition
   Assume some k in the range m<=k<n divides n then
     m divides n
     OR some k in the range m+1 <=k <n divides n
What happens if there is No k? m will equal n!!  So factors will return false. 
 

Write a tail recursive definition for factors. Notice to run the definition
you will need input the initial value of m=2.
  
i.e.
  Haskell1S05> factors1 2 83
  Bool_False

  Haskell1S05> factors1 2 (101*83)
  Bool_True


Use the "||" short circuit operator 
and the definition below for divides in your solution.  (What is the type 
(signature) of divides?)   You may use guards or if expressions.   

> divides m n = mod n m == 0


