YOUR NAME, EMAIL
Don't forget to rename file as defined in the instructions. You do not
have include above the "+++++" line in your hard copy.

Purpose:  Introduce Haskell by programming simple recursive functions 
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
  B) Continue to examine, via your text editor, 
     the Prelude.hs file that comes with your hugs. 
     What is the purpose of the file? 
     What is the most interesting function you find?  
     Do not turn in ... be prepared to discuss in class.  
     (Prelude.hs is in the lib directory.  Use a text editor to view.
      OR you can view http://haskell.org/onlinereport/prelude-index.html)
  C) Try on the command line 
   (You do not need to understand why everything works below.)
                 
      ...> [1 .. 12]
      ...> ['a' .. 'z']
      ...> [ (x,y) | x <-[1..5], y <- [2,4 .. 10]]
      ...> [ 1 ..]
      ...> :t 1
      ...> :t [1,2,3]
      ...> :t (+)
      ...> :t "abc"
      ...> :t ['a','b']
      ...> :t "abc" ++ "abc"

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
11/07
YOUR NAME, EMAIL
Assignment Haskell1.lhs

Problem 1:
(very easy) Write a Haskell script,  pyth(x,y), 
	    which returns the sum of  x*x and y * y
    ...> pyth(3,4)
    25 
      

    Code to follow this line.  Remember you must begin the code with ">"

> pyth(x,y) = 

  What is the type (signature) of pyth(x,y)?
  Write answer here.


Problem 2:
 Below is a recursive definition for computing x^n:
     power (a,n) = 1 if n =0
     power (a,n) = a if n =1
     power (a,n) = a*power(a,n-1) if n >1      
                         

 Complete the below Code:

> power :: Integer -> Integer -> Integer 
> power 0 n = 1
> 
> 


Problem 3: 
   Given a list of Integral, write a Haskell definition, addListWeird, 
   adds all the even numbers and doubles and adds the odd numbers.

 . You may use built in functions 
   such as "odd" or "even"
Complete the code below:

> addListWeird :: Integral a => [a]  -> a
> addListWeird [] = 0
> addListWeird (h:t) 
>     |




Problem 4:
The following function finds the maximum of three integers:

> maxOf3Ints :: Int -> Int -> Int -> Int
> maxOf3Ints x y z
>     | x >= y && x >= z = x
>     | y >= z           = y
>     | otherwise        = z 

Derive using previously defined functions (for this problem), 
the following functions. Include as a comment the inferred type 
of the new function. 
You find out the type by the command  ":t".
    For example:
    Define maxOf17and2Ints which is the max of two numbers and 17  
    (use maxOf3Ints).

maxOf999and2Ints :: Int -> Int -> Int

> maxOf999and2Ints = maxOf3Ints 999

      A) Define maxOf49and2Ints which is the max of two numbers and 49  
      (use maxOf3Ints).  (Place code BELOW --remember ">")
      CODE:
    



      B) Define maxOf49_8and1Int which is the max of one numbers 
         and 81 and 15
      (use maxOf49and2Ints).  (Place code BELOW --remember ">")
      CODE:


      C) Define numberSixteenHundredOne 
         which is the max of one numbers and 49, 8, 1601  
      (use maxOf49_8and1Int).  (Place code BELOW --remember ">")
      CODE:



Problem 5:      
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
       Boolean operators are:  not, &&, ||

Code:
 
> impliesE :: Bool -> Bool -> Bool







