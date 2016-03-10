Modified 4/12 2:pm 

You do not have include above the "+++++" line in your hard copy.
DONT forget to put you name after the "++++++" below

Purpose:  Introduce Haskell by programming simple recursive functions 
          and to experience the literal style of programming. 
          Using different number types in haskell.


Note: In the homework file put only one space between ">" and the code.  
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
   d) Practice:  DO NOT turn in.
      What does lF do? (See Below)

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

YOUR NAME, EMAIL

> module HaskellS021
>     where

 
> lF :: [a] -> Float
> lF = (\x -> encodeFloat ((toInteger . length) x) 0)



Note: 
I have put in the ">" where your code should be place.  Sometimes
I have indicated the first line of the code for you to complete
       > function arg = ?
  or 
       > function arg

I have also indicated if you should put the type by including a line
      > function :: ?
You should try to figure out the most general type that will work.

Because of these "?"  you will get errors when you load this file into 
hugs.


Problem 1:
(very easy) Write a Haskell script to count the number of occurrences 
of 3 in a list. You can use some pattern matching

i.e.

   HaskellS021> countC "abcdeohgeeabc"
   3
   HaskellS021> countC "nothing"      
   0
      
Code to follow this line.  Remember you must begin the code with ">"


> countMem :: ?
> countC ?




Problem 2: (Easy)
Write a Haskell script to count the number of occurences of an element e,  
in a lst.

> countE :: ?
> countE e lst = ?

  What is the type (signature) of countE ?
  Write answer here.

Problem 3:
Write a Haskell script to count the number of occurences of that the first 
character appears in the rest of the string. You may reuse problem 2.

> countF (f:rest) ? 



Problem 4: (Easy)

 Below is a recursive definition for computing x^n:
     power (a,n) = 1 if n =0
     power (a,n) = a if n =1
     power (a,n) = a*power(a,n-1) if n >1      
                         

  Finish the below Haskell definition to compute nth term in the sequence. 
  Complete the below Code: 

> power :: Integer -> Integer -> Integer 
> power 0 n = 1
>  ?
> 


Problem 5: 
   Given a list of Integral, write a Haskell definition,whose output will be
   a tuple (sum,prod) where sum is the sum of all the elements in the list
   and prod is the product of all the elements in the list. Do this using 
   primitive recursion.
i.e:
   HaskellS021> sumProduct[1,2,3,4,5]
   (15,120)
   HaskellS021> sumProduct[1.5,2.5,3.5,(-2)]
   (5.5,-26.25)



> sumProduct :: ?
> sumProduct (n:ns) = ? 
     




Problem 6: (Easy)
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
    Define maxOf which is the max of two numbers and 34  
    (use maxOf3Ints). NOTE there are no arguments.

> maxOf34and2Ints = maxOf3Ints 34

      A) Define maxOf81and2Ints which is the max of two numbers and 81  
      (use maxOf3Ints).  (Place code BELOW --remember ">")
      CODE:
    
>


      B) Define maxOf81_32and1Int which is the max of one numbers 
         and 81 and 32
      (use maxOf81and2Ints).  (Place code BELOW --remember ">")
      CODE:

>

      C) Define numberSixteenHundredOne 
         which is the max 34 81 and  1601  
      (use maxOf81_32and1Int).  (Place code BELOW --remember ">")
      CODE:

>

Problem 7: (Easy)       
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
       Boolean operators are:  not, &&, ||

Code:
 
> impliesE :: Bool -> Bool -> Bool
>


Problem 8:(CHANGED 4/10)
Given a list of tuple compute the sum and product of each tuple.
USE List comprehension technique.(This is One line wonder).
i.e
  > sumProdT  [(2,3),(34,2),((-3),21),(3,4)]]
  [(5,6),(36,68),(18,-63),(7,12)]
  
  > sumProdT [(2.5,3),(3.4,2),((-3),2.1),(3,4)]]
  [(5.5,7.5),(5.4,6.8),(-0.9,-6.3),(7.0,12.0)

> sumProdT lst = ?


Problem 9: (Easy)

Using the functions f ang g below define a function h that computes
(x + 3)^2 + 5. Use function composition. (Notice h has no arguments.)

 i.e.
 ... > h 4
 54

> f :: ?
> f x = x ^2 + 5
> g :: ?
> g x = x + 3

> h :: ?
> h = ?



Problem 10:


Define a function funnyFun that takes a function, fun  and a value. 
fun :: Integral a => a->a 
and value :: Integral a
If the value is even then apply fun to ( value plus 1)
 otherwise apply fun to the value/2.
You may use any functions defined in Prelude.

i.e.

> inc x = x + 1


HaskellS021> funnyFun (\x -> x + 105) 4
110
HaskellS021> funnyFun (\x -> x + 105) 3
106
HaskellS021> funnyFun (\x -> 3*x + 55) 3
58
HaskellS021> funnyFun (\v -> 2*v^2 + 5*v+ 1) 2
34

HaskellS021> funnyFun inc 2
4

> funnyFun :: ? 
> funnyFun fun v ?



