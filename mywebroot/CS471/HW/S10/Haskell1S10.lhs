> module Haskell1S10
>     where
       

Problem 1:
Write a Haskell script which implements Ackermann's function as defined in 
homework 1 problem 6.  Name your script "ack".  
You may use guards, and/or pattern matching in
your definition.  Predict the inferred type of ack.  Check you guess.



Problem 2:
A year is a leap year if it is divisible by 4 unless it is also 
divisible by 100 unless it is divisible by 400.
Write a script, isLeap, that determines whether a year is a leap year. 
a) You should write a single boolean expression. Do not use conditional expressions 
(involving if .. then .. else).
Try to predict the inferred type of isLeap.
(http://en.wikipedia.org/wiki/Leap_year#Algorithm)  (e.g.)
 
  Haskell1S10> isLeap 2000            
  True
  Haskell1S10> isLeap 2100
  False


b) Repeat using guards.



Problem 3: 
Implement Newton's method for calculating the square root of N. 
Your definition should include a user defined (input) "guess" value and a
user defined "nearEnough" value.  "nearEnough" is use to determine
when the guess is close enough to the square root.  (guess*guess = number)

e.g. 
   Haskell1S10> newtonAppr 144 1 0.1             
   12.000545730742438 
   Haskell1S10> newtonAppr 144 1 0.0001
   12.0000000124087
   Haskell1S10> newtonAppr 144 1 0.000000000000001
   12.0
   Haskell1S10> newtonAppr 5e+30 1 1000000000000000000000000000000  
   2.317148867384728e15
   Haskell1S10> newtonAppr 5e+30 1 100000000000000000000000000    
   2.2360684271923805e15




Problem 4:
In the written part of this assignment  you had the following problem:

   f(x) = 5*x + 3
   g(x) = 1 / (x+1)
   
    a) Let h be defined to be (f o g) ( i.e. h =  f o g ) .  
       What is the result of h(x) ?  Use the definition of f and g above.  
       Remember  (f o g) x is defined to be f ( g(x) )
       ( i.e. (f o g) x = f  ( g(x))  ).

    b) Let h2 be defined to be ( g o f )? What is the result of h2(x) ?

    c) What is the value of  h(2 )?

    d) What is the value of  h2 (2 ) ?

 Write a haskell definition of f, g, h and h2.  Use the function composition
 operator (.) in your definition of h and h2.  Notice that composition function
 returns a function and you do not need to include the argument x in your definition
 of h and h2.
 i.e. The left hand side of the definition for h (and h2) need only h = . 


Predict the types of f, g, h, and h2?  Now check your prediction.


Problem 5: Define a recursive style function 'sumDig n' such that sumDig returns
the sum of the digits of the number 'n'.  You should use the following 
operators: if expression, "+", mod and div. This can be done in one line of code.
   For example::  
    Haskell1S10> sumDig 1234
    10
    Haskell1S10> sumDig 9991234
    37
    Haskell1S10> sumDig 246135
    21


 

Problem 6:  Using a recursive style define 'reverseNum decNum accum', such that 
given a positive number using decimal notation, 'reverseNum dec accum' returns
the reverse representation of the number.  You can use 'accum' as an accumulating 
parameter and the following operators if expression, "+", mod and div .  
This can be done in one statement.  (While learning Prolog, we covered different
implementations of reversing a list, your solution should follow the technique 
used to implement revEff (slide 7).)

   Haskell1S10> reverseNum 12309 0
   90321
   Haskell1S10> reverseNum 123090019237777 0
   777732910090321







