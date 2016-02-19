YOUR NAME, EMAIL
Don't forget to rename file as defined in the instructions for 
submitting code.

Purpose:  Continue to program simple recursive functions 
          and to program using list comprehension.

Programming assignment 3.       
     Below you will see some sample output with reductions.  
     You can set Hugs to show your reductions by 

     ...>:set +s

I have put the beginnings of some the code.  You can use this as a beginning
of your code.  You complete this code at the "STUB"

problem 1:
USE PRIMATIVE RECURSION ONLY
1 ) A version of quicksort2 that uses a local function of 
    partitions which only traverse the list once.
    partition :: Ord a=> a-> [a] -> ( [a], [a] )
Below is a stub of the code.  You will need to complete it.
Added explicit types 9/27
CODE:

> quicksort::Ord a=> [a] -> [a]    
> quicksort [] = []
> quicksort (q:qs) =  (quicksort left) ++ [q]++ (quicksort right)
>	  where
>         (left, right) = partition q qs   
>         partition :: Ord a=> a -> [a] -> ( [a], [a] )    
>         partition p []  = ([],[])
>	  partition p (l:ls) 
             STUB.....





Problem 2:
Given a list of the binomial coefficient for the nth number calculate 
a list of binomial coefficient for the nth + number.  Use only primitive 
recursion.  
      binCoef :: (Num a) => [a] -> [a]
     (http://forum.swarthmore.edu/dr.math/faq/faq.pascal.triangle.html)
Basically we are given the "nth" row in the pascal triangle and 
we want to calculate the next row.
      (http://forum.swarthmore.edu/dr.math/problems/cotton2.27.96.html)
You can use a locally recursively defined function in your definition.  
  ...> binCoef [1,2,1]
  [1,3,3,1]
  (30 reductions, 66 cells)
  ...> binCoef (binCoef (binCoef [1,3,3,1]) )
  [1,6,15,20,15,6,1]
  (74 reductions, 192 cells)

  ...> (binCoef . binCoef . binCoef) [1,2,1]
  [1,5,10,10,5,1]
  (63 reductions, 157 cells)




CODE HERE: 


> binCoef :: (Num a) => [a] -> [a]



Problem 3: 
Using the idea of the induction proof for problem 12 assignment 1
   (http://bingweb.binghamton.edu/~head/CS471/HW/hw1f00.html#Powerset)
create the power set of a set.  Where sets are represented as lists.
It might be easier if you define a local function addElementToSets.

  ...> powerSet [1,2,3] 
  [[1,2,3],[2,3],[1,3],[3],[1,2],[2],[1],[]]
  (67 reductions, 205 cells)

> powerSet [] = [ [] ]
> powerSet (e:t) = STUB
>     where




Problem 4:  Use List comprehension to replace addElementsToSets.
  ...> powersetLC [1,2,3]
  [[1,2,3],[1,2],[1,3],[1],[2,3],[2],[3],[]]
  (106 reductions, 283 cells)

CODE HERE:

> powerSetLC []    = [[]]
> powerSetLC (x:xs) = STUB....


Problem 5:

Write a definition for flop, which applies the last value 
     (which is a function) 
to the reverse of the first two values.
This is very EASY.  ONE LINE!!  

  ...> flop 10 7 (-)
  -3
  (14 reductions, 17 cells)
  ...> flop 7 10 (-)
  3
  (14 reductions, 16 cells)
  ...> flop "abc" "ZYX" (++)
  "ZYXabc"
  (18 reductions, 44 cells)
  ...> flop 3 "abcdef" (!!)
  'd'
  (78 reductions, 141 cells)


> flop :: a -> b -> (b -> a -> c) -> c







