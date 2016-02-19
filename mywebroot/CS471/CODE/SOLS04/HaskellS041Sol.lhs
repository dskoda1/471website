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
   


> module HaskellS041
>     where

 

Note: 
I have put in the ">" where your code should be place.  Sometimes
I have indicated the first line of the code for you to complete
 
       > function arg




Problem 1:
(very easy) Write a Haskell script,  average(x,y), 
	    which returns the average of  x  y
    HaskellS041> average (3,5)
    4.0 
      

    Code to follow this line.  Remember you must begin the code with ">"

> average (x,y) = (x+y)/2.0

  What is the type (signature) of calcPair(x,y)?
  Write answer here.


Problem 2:

> 