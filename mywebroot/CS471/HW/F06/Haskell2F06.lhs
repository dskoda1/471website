> module Haskell2F06 where

YOUR NAME, EMAIL
Purpose:  To practice the abstraction using Higher order function.
          Some more experience with list comprehension notation.
          More practice with primitive recursion.
          

Practice and experimenting:
(Do not turn or print out the practice and experimenting section)

What do the following functions do?
  ...> drop 4 [1 .. 10]
  ...> take 4 [1 .. 10]
  ...> dropWhile (>44) [100, 85 .. 1]
  ...> splitAt 4 "abdcxyz"
  ...> fromEnum True
  ...>  (\c -> fromEnum c - fromEnum 'A') 'a'

What is the type and what is the purpose of the of 
   curry
   uncurry

Write curry and uncurry as a lambda expression.




10.2 (Thompson) (id is a built in function) 
     If id is the polymorphic identity function, defined by
      id x = x
     explain the behavior of the expressions:
     
     (id . f)       (f .id )         id f

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

problem 1:

Define a function 
   average :: Double -> Double -> Double
which returns the average of two numbers
Use only a lambda expression in your definition. (average = your lambda expression)

   e.g. 
   ...> average 4 55
   29.5




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
  Define powerS by modifing powerT to force the accumulator argument 
  to be evaluated prematurely, using the operator ($!) as illustrated in factS.
Answer:

> powerS :: Integer -> Integer -> Integer

  4d:
  Convert the algorithm used in turboPower to tail recursive form. Call the
  definition turboTPower.

> turboTPower :: Integer -> Integer -> Integer









