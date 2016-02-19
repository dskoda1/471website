> module Haskell1F06
>     where

 Practice:
         
  Note: In the homework file put only one space between 
        ">" and code (beginning of definition).  
         Do not use a tab...  JUST one SPACE.
  A) Just looking in around ...  experiments. Not to be handed in!
     (After opening hugs you will get a prompt 
      Prelude> <your file name if you clicked on .lhs file> )
      a) What does ...> :? <return> do?
      b) What does 
                ...> :t mod <return>  
                ...> :t head <return> 
                ...> :t (:) <return> 
                ...> :t last <return>
         display?

  B) Continue to examine, via your text editor, 
     the Prelude.hs (and Hugs.Prelude.hs)  files that comes with your hugs. 
     What is the purpose of the file? 

     What is the most interesting function you find?  
     Do not turn in ... be prepared to discuss in class.  

     (Prelude.hs and hugs.Prelude.hs in the lib and Hugs directory. 
      You can use a text editor to view.
      OR you can view http://haskell.org/onlinereport/prelude-index.html)

  C) What are the two uses of ":" in the language?

Problem 1:
(very easy) Write a Haskell script,  pyth(x,y), 
	    that returns the sum of  X * X and Y * Y

    ...> pyth(3,4)
    25 
    Code to follow this line.  Remember you must begin the code with ">"

>


  Predict type (signature) of pyth(x,y)?

Problem 2: Redo problem 1. Without using the compound data 
                           type, tuple. e.g.
                    ...> pythC 3 4
                    25
 

>

  Predict the type of pythC x y.
  Predict the type of pythC x .
  Predict the type of pythC .


Problem 3: Define pythP using a partical evaluation of pythC, defined in
problem 2.  pythP calculates the sum  X * X and Y * Y 
such that X has the value 5. (i.e. The left hand side of the definition only
needs the name of the function, pythP = ) e.g.
           ...> pythP 4
           41

> 


 Try to predict the type of pythP.

Problem 4:
Ackerman functions as defined in homework 1 problem 7.

> 
> 
> 
> 
> 



Problem 5: 
Implement Newton's method for calculating the square root of N. 
Your definition should include a user defined (input) "guess" value and a
user defined "nearEnough" value.  "nearEnough" is use to determine
when two sequenial guesses are close enough to use the guess as the
square root.

e.g. number = 5e+30, guess is 1 and nearEnough is 100000
            "             "    nearEnough is 10000000000000000000000000000000
 
  Haskell1F06> newton 5e+30 1 100000 
  1.23762376237624e+30
  Haskell1F06> newton 5e+30 1 10000000000000000000000000000000 
  2.5e+30

> 

 

Problem 6:      
   The function "implies"  takes two Boolean arguments and returns a
   Boolean Result.  (The type of each function is include below.)

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



problem 7:

Define a Haskell function merge :: [Int] -> [Int] ->[Int] so that if the 
lists as and bs are ordered, merge as bs is an ordered list containing all
the elements of as and bs.




Problem 8:
In the written part of this assignment  you had the following problem:
   f(x) = 1 / x
   g(x) = x*x + 2

   
    a) Let h be defined to be (f o g) ( i.e. h =  f o g ) .  What is the result of h(x) ?  
       Use the definition of f and g above.  Remember  (f o g) x is defined to be f ( g(x) )
       ( i.e. (f o g) x = f  ( g(x))  ).

    b) Let h2 be defined to be ( g o f )? What is the result of h2(x) ?

    c) What is the value of  h(2 )?

    d) What is the value of  h2 (2 ) ?

 Write a haskell definition of f, g, h and h2.  Use the function composition
 operator (.) in your definition of h and h2.  Notice that composition function
 returns a function and you do not need to include the argument x in your definition
 of h and h2.
 i.e. The left hand side of the definition for h (and h2) need only h = . 

> 
> 
> 
> 


Predict the types of f, g, h, and h2.
