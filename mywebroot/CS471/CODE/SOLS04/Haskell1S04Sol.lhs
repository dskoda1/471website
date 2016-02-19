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

  C) Pattern matching in Haskell
     (a:b:t)  
      a matches the first element, b matches the second element and t is the tail of the list.

  D) You will need to write at most two lines of code to finish each function.

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

YOUR NAME, EMAIL

> module HaskellS041 where
> import Prelude hiding (reverse)
> 

 

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


Problem 1: (Very easy)
 Below is a recursive definition for calculating nth term of a 
 sequence of numbers: 
          a(n) is 1                            if n = 0 
          a(n) is 2                            if n = 1 
          a(n) is a(n-1) * a(n-2)       if n > 2
 Finish the below Haskell definition to compute nth term in the sequence. 
 Complete the below Code:

> a :: Integer -> Integer
> a 0 = 1
> a 1 = 2
> a n = a (n-1) * a (n-2)  ---answer



Problem 2: (very easy)
 Some terms:
    A) function exhibits 'parmettric polymorphism' if it has a type that contains
       one or more type variables.
    B) type with a type variables like 
        Ea a => a -> a -> Bool
      is called a 'polytype'.
  Reference: Modern Progamming Languages by Adam Webber

 Write a Haskell (curry) function definition for each of the following functions.
 (Remember that the "parameters" will not be coded in "()" 
  i.e f(x) is defined to be 3 * x 
      would be in written in Haskell as
     > f x  = 3 * x
  )
 Try to predict polytype Haskell infer for each function.  Then check your prediction 
 using the ":t" command.  You need only turn in your code.

   a) fa(x) is 3
   b) fb(x,y) is 3
   c) fc(x) is x
   d) fba(x,y) is fa(x)
   e) fd(g) is g(1)
   f) fe(g, x) is g(x)
   g) ff(g,x,y) is g(x,y)
   h) fg(g,h,x) is g(h(x))
   i) fi(g,x) is g( g(x)) BECAREFUL 
ANSWER:

> fa x = 3
> fb x y = 3
> fc x = x
> fba x = fa x
> fd g = g 1
> fe g x = g x
> ff g x y = g x y
> fg g h x = g h x
> fi g x = g (g x)


Problem 3
Write a polymorphic script, rev,  to reverse a list of elements.  
YOU SHOULD use the append function, (++), in your code. 
Can you predict the most general type of this function?

> reverse [] = []
> reverse (h:t) = reverse t ++ [h]



Problem 4
Redo problem 3 using "con's" (:) and an auxiliary parameter. 
Try to predict the infered type of this function.

   HaskellS041> reverse4 [1,2,3] []
   [3,2,1]        
 
--  Compare the complexity of the algorithm used in problem 3 with the algorithm in problem 4.
    1) What is theta of problem 3?
    2) What is theta of problem 4?
    3) Which algorithm would you choice?
    


> reverse4 [] ls = ls
> reverse4 (h:t) ls = reverse4 t (h:ls)

Problem 5

Write a polymorphic function member, that returns true if e is an element in ls and false otherwise.
Try to predict the infered type of this function.  Check your prediction.

> member e (h:t) = (e==h)||member e t
> member e [] = False

Problem 6
Write a polytype Haskell function that given a list of Type Ord and returns either 
      True if the list is in increasing 
or
     False if the list is Not.

HaskellS041> isIncreasing [False,True]
True
HaskellS041> isIncreasing [2.3,4.5,9.999]
True
HaskellS041> isIncreasing "aeiouxyz"
True
HaskellS041> isIncreasing [1,2,3,6,9]
True
HaskellS041> isIncreasing "aAbB"
False


> isIncreasing (h:h2:t) = (h < h2) && isIncreasing(h2:t)
> isIncreasing [h] = True
> isIncreasing [] = True  --- Just in case there is an empty list.



Problem 7:

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
    Define maxOf999and2Ints which is the max of two numbers and 999  
    (use maxOf3Ints).

maxOf999and2Ints :: Int -> Int -> Int

> maxOf999and2Ints = maxOf3Ints 999


      A) Define maxOf49and2Ints which is the max of two numbers and 49  
      (use maxOf3Ints).  (Place code BELOW --remember ">")

      CODE:

> maxOf49and2Int  = maxOf3Ints 49

      B) Define maxOf49_8and1Int which is the max of one numbers 
         and 81 and 15
      (use maxOf49and2Ints).  (Place code BELOW --remember ">")


      CODE:

> maxOf49_8and1Int = maxOf49and2Int 8

      C) Define numberSixteenHundredOne 
         which is the max of one numbers and 49, 8, 1601  
      (use maxOf49_8and1Int).  (Place code BELOW --remember ">")


      CODE:





Problem 8:      
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
> impliesC x y = if x then y else True


   b. Using guards
  
Code:
 
> impliesG :: Bool -> Bool -> Bool
> impliesG x y
>     | x = y
>     | otherwise = True



    c. Using a single Boolean expression 
       Boolean operatores are:not, &&, ||

Code:
 
> impliesE :: Bool -> Bool -> Bool
> impliesE x y = not x || y


Problem 9.
Write a script, palindrome, which is true if a list is a palindrome and false otherwise.
DO NOT USE REVERSE in your definition.  
Predict and check the infered typed of this definition.

> palindrome [] = True
> palindrome (h:[])= True
> palindrome lst = head lst == last lst && palindrome (init (tail lst))


problem 10:
Write a script, maxMin , given a list returns a tuple where 
      the first element is the maximum value in the list
 and the second element is the minimum value in the list.
Predict and check the infered type of this function. 

    HaskellS041> maxMin [1, 3, 5, 7, -80, 3, 100, -3, 45]
    (100,-80)   

> maxMin [a] = (a,a)
> maxMin (a:as) = (max a (fst (maxMin as)), min a (snd (maxMin as)))

