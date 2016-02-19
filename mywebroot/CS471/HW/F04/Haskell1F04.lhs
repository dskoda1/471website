> module Haskell1F04
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

Problem 1: (easy)
The purpose of problems 1 and 2 is for you to see the difference between 
applying functions to tuples of values and applying functions to constant values

(very easy) Write a Haskell script,  average(x,y), which returns the average of x and y
    ...> average(75,25)
    50 
      

Code to follow this line.  Remember you must begin the code with ">"

> 

  What is the derived type (signature) of average?
  Write answer here.


Problem 2: (easy)

Rewrite problem one except you won't apply the function to a tuple but an application of 3 "functions"
To execute type:
   Haskell1F04> averageA 25.5 75.5
   50.5 


> 


    What is the derived type of averageA  ?

Given the following definition:

> averageP = averageA 4

What is the (derived) type of averageP?


Problem 3:  
Use Newton's method to compute the square root of n.  
(See problem 5 in the written part). 

To execute you would type:
   Haskell1F04> newton 25 1 0.00000000001
   5.0
   Haskell1F04> newton 25 1 0.0001
   5.00000000005372    
   
25 is the number. The guess is 1.0. The decimal is "near", which is used to test if the 
next guess is not much of a change.  If the new guess is "near" the guess terminate the recursion 
and return the new guess.

 


Problem 4:
Define a data type Point that represents a point in a plane and 
the coordinate values should be Doubles.  

Write a function "isOrigin" that returns true if the point is the origin 
and false otherwise.  If the constructor for your Point is Pt then to execute you type:

    Haskell1F04> isOrigin (Pt 0.0 0.0)
    True  
    Haskell1F04> isOrigin (Pt 3.0 0.0)
    False     

Try to predict the type of isOrigin then check your answer.  




>
 
>


Problem 5: 
Write a Haskell function "inside point r " which returns 
          true if and only if the point lies inside a circle of radius r.
          and false otherwise. 

"inside" can be defined as:
    inside  r point (x, y) is true  if and only if x^2 + y^2 < r^2
where x and y are the coordinates of the point.
Your Haskell code should not be using tuples.
If your contructor for Point is Pt then to execute you type:

   Haskell1F04> inside 10.0 (Pt 3.0 2.5)
   True
   Haskell1F04> inside 10.0 (Pt (-1) (-2))
   True 
   Haskell1F04> inside 2.0 (Pt 3.0 2.5)
   False         

> 



Problem 6:
The purpose of this problem is to use a partially evaluation of "inside" to define insideRadius5.  
Complete the definition of insideRadius5 to returns true if a point is inside r and false otherwise.
Notice: You do not need to apply anything to insideRadius5 when defining it. 
To execute you type :
  Haskell1F04> insideRadius5 (Pt 2.0 1.0)
  True 

> insideRadius5 = 


Problem7:
Write a Haskell definition  "collinear p1 p2 p3", which is true if and only if p1, p2, and p3 
lie on a straight line. One definition is as follows:

collinear((x1,y1), (x2,y2), (x3, y3)) if and only if (x1 -x2)(y2 -y3) equals (y1 -y2)(x2 -x3) 

Assuming Pt is the contructor for your PointtTo execute type:
   Haskell1F04> collinear (Pt 1.0 1.0) (Pt 2.0 2.0) (Pt 3.3 3.3)
   True 

> 

Problem 8: (easy) 


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
> 


   b. Using guards
  
Code:
 
> impliesG :: Bool -> Bool -> Bool
> 


    c. Using a single Boolean expression 
       Boolean operatores are:not, &&, ||

Code:
 
> impliesE :: Bool -> Bool -> Bool
> 



Problem 9: (easy)
The written part of this assignment you had following problem:
   f(x) = 3x + 2
   g(x) = 2x + 3

   1. What is the function composition,  (f o g) (x ) = ?
 
   2. What is  (g o f) (x ) = ?

   3. What is the value of  (f o g) (2 ) = ?

   4. What is the value of (g o f ) (2 ) = ?

Complete the haskell definition of f and g as described above.  
Then complete the definition for
      composefg 
so that it computes (f o g) and 
   composegf 
so that it computes  (g o f ).  

You should use the "." compose operator.

NOTICE that composefg and composegf do NOT have arguments. Does
the code produces the results calculated on the written part?


> f x =
> g x =
> composefg = 
> composegf = 


What are the types of f, g, composefg, composegf?
