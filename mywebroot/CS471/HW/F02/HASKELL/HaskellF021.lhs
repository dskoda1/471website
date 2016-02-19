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

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

YOUR NAME, EMAIL

> module HaskellF021
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

Problem 1:
(very easy) Write a Haskell script,  calcPair(x,y), 
	    which returns the sum of  x and 4 * y
    ...> calcPair(3,5)
    23 
      

    Code to follow this line.  Remember you must begin the code with ">"

> calcPair(x,y) = 

  What is the type (signature) of calcPair(x,y)?
  Write answer here.



Problem 2: (Very easy)
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





