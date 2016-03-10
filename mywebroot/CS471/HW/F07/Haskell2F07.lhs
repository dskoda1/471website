> module Haskell2F07SOL
>    where

In covered in Friday's class
++++++++Non graded problem++++++++++++
Define subSeq which given a sequence of values in a list create a list
of lists that contain all the suffixes of the original list.
e.g.
   Haskell2F07> subSeq [1,1,2,3,5]
   [[1,1,2,3,5],[1,2,3,5],[2,3,5],[3,5],[5],[]]

What is the most general type of subSeq?

++++++++GRADED assignment+++++++++

Problem 1a:
Implement the function 
          maxNT :: Ord a => [a] -> a
Which returns the maximum value of the argument list. You must implement 'maxNT'
recursively and it must not be in a tail recursive form.  Hint: you may need to
code the base case first.  You may assume the list has at least one element.




Problem 1b:
Implement the function 
          maxT :: Ord a => [a] -> a
Which returns the maximum value of the argument list. You must implement 'maxT'
recursively and it must be in a tail recursive form. If you are clever you can
do this without an additional argument. You may assume the list has at least 
one element.



Problem 2:
Define a function 
   swap :: (a -> b ->c) -> b -> a -> c
which applies a binary function to arguments in reverse order. Use only a 
lambda expression in your definition. (swap = your lambda expression)
    Some sample invocations are:
    ....> swap (-)  4 5
    1 
    ....> swap (\x y-> y- 2*x) 4 5
    -6

 

Note: in python you can not pass an operator.
   
sub = lambda x, y: x - y

so you can invoke::  swap(sub, 4,5)
                     >>> swap ((lambda x,y: y - 2*x),4,5)
-6

problem 3&4:
Below is the code for the first 2 written questions.

> power :: Integer -> Integer -> Integer
> power a 0 = 1
> power a b = a * power a (b-1)

> powerT :: Integer -> Integer -> Integer
> powerT a b = trp b 1
>      where
>      trp n p = if (n==0) then p else trp (n-1) (a*p)

> turboPower a 0 = 1
> turboPower a b
>     | even b = turboPower (a*a) (b `div` 2)
>     | otherwise = a * turboPower a (b-1)




  3e:
  Define powerS by modifing powerT to force the accumulator argument 
  to be evaluated prematurely, using the operator ($!) as illustrated in factS.
Answer:



  4d:
  Convert the algorithm used in turboPower to tail recursive form. Call the
  definition turboTPower.
Answer:



Problem 5:
Define 'consEtoSubSeq e lst' which given a sequence of values in a list creates a
list of lists which contains all the suffixes of the original list cons with
the element e.  Use primitive recursion. e.g.

   Haskell2F07SOL> consEtoSubSeq 9 [1,1,2,3,5]
   [[9,1,1,2,3,5],[9,1,2,3,5],[9,2,3,5],[9,3,5],[9,5],[9]]



