> module Haskell1S08
>     where

 Note: In the homework file put only one space between 
        ">" and code (beginning of definition).  
         Do not use a tab...  JUST one SPACE.
     

     Examine, via your text editor, the Prelude.hs (and Hugs.Prelude.hs)
     files that comes with your hugs.  What is the purpose of the file? 

     What is the most interesting function you find?  
     Do not turn in ... be prepared to discuss in class.  

     (Prelude.hs and hugs.Prelude.hs in the lib and Hugs directory. 
      You can use a text editor to view.
      OR you can view http://haskell.org/onlinereport/prelude-index.html)
      
      
Problem 1:
Write a Haskell script which implements Ackermann's function as defined in 
homework 1 problem 9.  Name your script "ack".  
You may use guards, and/or pattern matching and/or if expressions in
your definition.  Predict the inferred type of ack.  Check you guess.



Problem 2:
A year is a leap year if it is divisible by 4 unless it is also 
divisible by 100 unless it is divisible by 400.
Write a script, isLeap, that determines whether a year is a leap year. 
You may use simple guards, patterns, and binary boolean operators. 
For this exercise avoid using conditional expressions 
(involving if .. then .. else). Challenge write it as the result of a 
single expression.  
Try to predict the inferred type of isLeap.
(http://en.wikipedia.org/wiki/Leap_year#Algorithm)


Problem 3:      
The function "implies" takes two Boolean arguments and returns a Boolean Result.  

   Its truth table is:


      x       y         implies x y

      True    True         True
      True    False        False
      False   True         True
      False   False        True

   Define implies three ways:

   a. Using conditional expression (if..then...else)
Code:
 




   b. Using guards
  
Code:
 




    c. Using a single Boolean expression 
       Boolean operators are:not, &&, ||

Code:
 




Problem 4:
Write a function cancel that takes two integers, returns a pair of integers with
the rightmost digit removed from each, if and only if both rightmost digits 
are zero. (hint: use mod and div)

for example:

cancel 1230 4560  = (123,456) 




Problem 5:
In the written part of this assignment you had the following problem:

   f(x) = 3*x + 5
   g(x) = 1 / (x-1)
   
    a) Let h be defined to be (f o g) ( i.e. h =  f o g ) .  
       What is the result of h(x) ?  
       Use the definition of f and g above.  
       Remember  (f o g) x is defined to be f ( g(x) )
       ( i.e. (f o g) x = f  ( g(x))  ).

    b) Let h2 be defined to be ( g o f )? What is the result of h2(x) ?

    c) What is the value of  h( 2 )?

    d) What is the value of  h2 (2 ) ?

Write a haskell definition of f, g, h and h2.  Use the function composition
operator (.) in your definition of h and h2.  Notice that composition function
returns a function and you do not need to include the argument x in your definition
of h and h2.
 i.e. The left hand side of the definition for h (and h2) need only h = . 
Predict the inferred types of f, g, h, and h2.  Verify your guess.

> f(x) = 3*x + 5
> g(x) = 1 / (x-1)


Problem 6: Write a recursive definition, mul x y, that returns the product x*y. (Do
not use "*" operator).




Problem 7: 
The harmonic series is the following infinite series:
                            1   1   1   1               1
                      1 +   - + - + - + - + ...   + ... - ..
                            2   3   4   5               i
(http://en.wiped.org/Viki/Harmonic_series_(mathematics))
Write a function sum Harmonic such that sum Harmonic i is the sum of the first i
terms of this series. For example, sum Harmonic 4 ~> 1 + 1 + 1 + 1 ~> 2.08333 . . ..
                                                         2   3   4
sum Harmonic has type  Fractional a => a -> a
(remove the " " before >)


  > sumHarmonic :: Fractional a => a -> a



Problem 8:
The formula for the nth Tetranacci number Tn is defined as follows:
                                   
                          T0   =   0
                          T1   =   1
                          T2   =   1
                          T3   =   2
                          Tn   =   Tn-1 + Tn-2 + Tn-3 + Tn-4 .
                          
Implement a recursive Haskell function which accepts an integer n (you may 
assume that n >= 0), and computes the nth Tetranacci number 
(don't worry about efficiency, only about making the definition as simple 
as possible). In your code, specify a type for the
function which ensures that it accepts and returns only arguments of type Int. 
What is the approximate number of times this function will be called on an 
input of size n?
e.g.
     ...> tetra 5
     8
     ...> tetra 8
     56


Problem 9:

Define the function "while" such that  "while pred xs" returns the longest
initial segment of the list xs all of whose elements satisfy the Boolean-valued
function pred . E.g.
             ...> while even [2, 4, 8, 3, 4, 8, 6] 
             [2, 4, 8]
             ...> while odd [2,3,4]
             []
             ...> while ((1 ==).fst) [(1,4),(1,2),(4,5)]
             [(1,4),(1,2)]
                          




