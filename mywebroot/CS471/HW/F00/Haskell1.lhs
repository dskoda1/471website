CORRECTED 9/13/00
YOUR NAME, EMAIL
Don't forget to rename file as defined in the instructions for 
submitting code.

Purpose:  Introduce Haskell by programming simple recursive functions 
          and to experience the literal style of programming.

          You do not need to use modules on this assignment.

Problem 2:
(very easy) Write a Haskell script,  calcPair(x,y), 
	    which returns the sum of  x and 2 * y
    ...> calcPair(3,5)
    13 
      

    Code to follow this line.  Remember you must begin the code with ">"


  What is the type (signature) of calcPair(x,y)?
  Write answer here.



Problem 3:
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
    Define maxOf7and2Ints which is the max of two numbers and 7  
    (use maxOf3Ints).

maxOf7and2Ints :: Int -> Int -> Int

> maxOf7and2Ints = maxOf3Ints 7

      A) Define maxOf9and2Ints which is the max of two numbers and 9  
      (use maxOf3Ints).  (Place code BELOW --remember ">")
      CODE:




      B) Define maxOf9_15and1Int which is the max of one numbers and 9 and 15
      (use maxOf9and2Ints).  (Place code BELOW --remember ">")
      CODE:


      C) Define numberSixteen which is the max of one numbers and 9, 15, 16  
      (use maxOf9_15and1Int).  (Place code BELOW --remember ">")
      CODE:




Problem 4:
    Write a Haskell script zipPair L1 L2, which returns a list of pairs.
    Haskell provides pattern matching and list operators so the lefthand 
    side of function will be
        zipPair (h:t) (n:ns)
    (h:t) h matches the head of the list and t matches the tail --
    like prolog.
    
    ...> zipPair [1,2,3] ['a','b','c','d']
    [(1,'a'), (2,'b'), (3,'c')]
    CODE:


                                                     

    What is the signature of zipPair?

Problem 5: --9/13
   Define a function calcPairLst lst1 lst2 which applies zipPair 
         in its definition to return a list of the product pairs.
    ...> calcPairLst [1,2] [11,12,100]
    [23,26]
    ...> calcPairLst [1,2,3] [100,99]
    [201,200]


    What is the signature of calcPairLst?


Problem 6:
   Using the the data type Pair provided below,  
   write a Haskell script zipPairtype lst1 lst2, which 
   returns a list of Pairs.

> data Pair = Pair Int Int deriving Show
>    



   What is the signature?
 








