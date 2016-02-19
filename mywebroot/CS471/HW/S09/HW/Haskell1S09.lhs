> module Haskell1S09
>     where
       
  Note: In the homework file put only one space between 
        ">" and code (beginning of definition).  
         Do not use a tab...  JUST one SPACE.
     

  A) Examine, via your text editor, the Prelude.hs (and Hugs.Prelude.hs)
     files that comes with your hugs. 
     What is the purpose of the file? 

     What is the most interesting function you find?  
     Do not turn in ... be prepared to discuss in class.  

     (Prelude.hs and hugs.Prelude.hs in the lib and Hugs directory. 
      You can use a text editor to view.
      OR you can view http://haskell.org/onlinereport/prelude-index.html)


  
++++++++++++++++ANSWERS+++++++++++++++++++++++
Problem 1:
Write a Haskell script which implements Ackermann's function as defined in 
homework 1 problem 8.  Name your script "ack".  
You may use guards, and/or pattern matching and/or if expressions in
your definition.  Predict the inferred type of ack.  Check you guess.



Problem 2:
A year is a leap year if it is divisible by 4 unless it is also 
divisible by 100 unless it is divisible by 400.
Write a script, isLeap, that determines whether a year is a leap year. 
You should write a single boolean expression. Do not use conditional expressions 
(involving if .. then .. else) or code with guards.
Try to predict the inferred type of isLeap.
(http://en.wikipedia.org/wiki/Leap_year#Algorithm)




Problem 3:      
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
Note:: take out the spaces before ">"
 
  > impliesC :: Bool -> Bool -> Bool



   b. Using guards
  
Code:
 
  > impliesG :: Bool -> Bool -> Bool


    c. Using a single Boolean expression 
       Boolean operatores are:not, &&, ||

Code:
 
   > impliesE :: Bool -> Bool -> Bool




Problem 4:
In the written part of this assignment  you had the following problem:

   f(x) = 2+ 3x - x*x
   g(x) = 2x -1
   
    a) Let h be defined to be (f o g) ( i.e. h =  f o g ) .  
       What is the result of h(x) ?  
       Use the definition of f and g above.  
       Remember  (f o g) x is defined to be f ( g(x) )
       ( i.e. (f o g) x = f  ( g(x))  ).

    b) Let h2 be defined to be ( g o f )? What is the result of h2(x) ?

    c) What is the value of  h(2 )?

    d) What is the value of  h2 (2 ) ?

 Write a haskell definition of f, g, h and h2.  Use the function composition
 operator (.) in your definition of h and h2.  Notice that composition function
 returns a function and you do not need to include the argument x in your 
 definition of h and h2.
 i.e. The left hand side of the definition for h (and h2) need only h = . 



Predict the inferred types of f, g, h, and h2. Check your guesses. 

Problem 5: Define a recursive style function 'sumDig n' such that sumDig returns
the sum of the digits of the number 'n'.  You should use the following operators; 
   if expression, "+", od and div. This can be done in one line of code.
   For example::  
    Haskell1S09> sumDig 1234
    10
    Haskell1S09> sumDig 9991234
    37
    Haskell1S09> sumDig 246135
    21

Problem 6:  In homework 1 problem 2  you were given the following recursive 
C code:
   
   int gcdR(int a, int b) {
     if (a!=b) {
       if (a > b) {
         return gcdR(a - b, b);
       } else {
         return gcdR(a, b-a);
       }
     } else {
       return a;
     }

   } 
Convert this program to Haskell.  Use guards.




  
Problem 7:  Using a recursive style define 'reverseNum decNum accum', such that 
given a positive number using decimal notation, 'reverseNum dec accum' returns
the reverse representation of the number.  You can use accum as an accumulating 
parameter and the following operators: if expression; "*"; mod and div .  
This can be done in one line of code.  

   Haskell1S08> reverseNum 12309 0
   90321
   Haskell1S08> reverseNum 123090019237777 0
   777732910090321






