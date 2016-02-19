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

  C) Some hints on pattern matching in Haskell
     (a:b:t)  
      a matches the first element, b matches the second element and t is the tail of the list.

  D) You will need to write at most two lines of code to finish each function.

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

YOUR NAME, EMAIL

> module HaskellS032
>     where

 

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
          a(n) = 1                            if n = 0 
          a(n) = 2                            if n = 1 
          a(n) = a(n-1) * a(n-2)       if n > 2
 Finish the below Haskell definition to compute nth term in the sequence. 
 Complete the below Code:

> a :: Integer -> Integer
> a 0 = 1
> a 1 = 2
> a n =


Problem 2: (code is very easy but typing will require thinking)
  ( Some terms:
      A function exhibits 'parmetric polymorphism' if it has a type that contains
        one or more type variables.
      A type with a type variables like 
          Eq a => a -> a -> Bool
        is called a 'polytype'.
    Reference: Modern Progamming Languages by Adam Webber
  )
 Write a Haskell function definition for each of the following functions.
 Try to predict polytype Haskell infer for each function.  Then check your prediction 
 using the ":t" command.  You need only turn in your code.  NOTE: each definition is only ONE 
 Line of code.

   a) fa(x) = 1
   b) fb(x,y) = 1
   c) fc(x) = x
   d) fd(g) = g(1)
   e) fe(g, x) = g(x)
   f) ff(g,x,y) = g(x,y)
   g) fg(g,h,x)= g(h(x))
   i) f(g,x) = g( g(x))  --- BECAREFUL  

You should be writting curried functions. For example the code for 3a is:

> fa x = 1
> 





Problem 3: (very easy)
Write a Haskell function that takes a lists of tuples returns a list of the sum of the tuples.
You can assume the input includes at least one tuple.  What is the polytype of your function?


HaskellS032> sumtuple [(1.3,0.7), (4.5, -1.5)]
[2.0,3.0]
HaskellS032> sumtuple [(1,99),(-3,5)]
[100,2]

> sumtuple [(x,y)] = [x+y]  -- base case
> 


Problem 4:
Write a polytype Haskell function that given a list of Type Ord and returns either 
      True if the list is in increasing 
or
      False if the list is Not.
HaskellS032> isIncreasing [False,True]
True
HaskellS032> isIncreasing [2.3,4.5,9.999]
True
HaskellS032> isIncreasing "aeiouxyz"
True
HaskellS032> isIncreasing [1,2,3,6,9]
True
HaskellS032> isIncreasing "aAbB"
False


> isIncreasing [] = True  --- Not necessarily a base case.  Depending on your recursive definition you may need a base case.




Problem 5
Convert this Prolog code to Haskell:

   %5 accumProd(+Lst, RprodLst).
   accumProd([V],[V]). 
   accumProd([H|T],[RH,RP|RT]):-accumProd(T,[RP|RT]),
	                        RH is H * RP.


