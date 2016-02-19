> module HaskellTRS07 where

YOUR NAME, EMAIL
Purpose:  Understand tail recursion
     
Monday's class:
Define a generic Haskell function
   merge :: Ord a => [a] -> [a] ->[a]
such that if the lists as and bs are ordered, 'merge as bs' ,  is an ordered 
list containing all the elements of as and bs.

Wed's class
What do the following functions do?
  ...> drop 4 [1 .. 10]
  ...> take 4 [1 .. 10]
  ...> dropWhile (>44) [100, 85 .. 1]
  ...> splitAt 4 "abdcxyz"
  ...> fromEnum True
  ...>  (\c -> fromEnum c - fromEnum 'A') 'a'

Can you predict the type of dropWhile? splitAt? drop?

10.2 (Thompson) (id is a built in function) 
     If id is the polymorphic identity function, defined by
      id x = x
     explain the behavior of the expressions:
     
     (id . f)       (f .id )         id f
     
Helpful tips:
     Pattern matching:
       [x] -- matches a list with one element
       (x:y:ys) -- matches a list with at least 2 elements named x and y
       (x:xs) -- matches a list with at least 1 element

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++     

Problem 1a:
Implement the function 
          minNT :: Ord a => [a] -> a
Which returns the minimum value of the argument list. You must implement 'minNT'
recursively but it must not be in a tail recursive form. You may use 'min' in 
your solution. Hint: you may need to code the base case first. If your solution
needs to code the base case first, see if you can figure out why. 


Problem 1b:
Implement the function 
          minT :: Ord a => [a] -> a
Which returns the minimum value of the argument list. You must implement 'minT'
recursively and it must be in a tail recursive form. You may use 'min' in your
solution.  Hint: it is cleaner if you do not use an extra argument (acc).

         
Problem 2: Define a function 
   swap :: (a -> b ->c) -> b -> a -> c
which applies a binary function to arguments in reverse order. Use only a 
lambda expression in your definition. (swap = your lambda expression)
    Some sample invocations are:
    ....> swap (-)  4 5
    1 
    ....> swap (\x y-> y- 2*x) 4 5
    -6

problem 3:
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


  3a:
  Define powerS:: Integer -> Integer -> Integer, by modifing powerT to force 
  the accumulator argument to be evaluated prematurely, using the operator ($!) 
  as illustrated in factS.

  4d:
  Convert the algorithm used in turboPower to tail recursive form. Call the
  definition turboTPower :: Integer -> Integer -> Integer.









