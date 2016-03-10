> module Haskell2F08
>    where

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


Nov 2005 runs:

power 2 32500

(422533 reductions, 40455167 cells, 41 garbage collections)

powerT 2 32500
(390033 reductions, 40422669 cells, 41 garbage collections)


powerS 2 32500
(422533 reductions, 40455169 cells, 41 garbage collections)
         36000
(468033 reductions, 49553099 cells, 50 garbage collections)

turboPower 2 36000
(1499 reductions, 31326 cells)

turboTPower 2 100000
(1614 reductions, 52788 cells)


turboPower 2 100000
(1615 reductions, 84812 cells)


  3e:
  Define powerS by modifing powerT to force the accumulator argument 
  to be evaluated prematurely, using the operator ($!) as illustrated in factS.
Answer:


  4d:
  Convert the algorithm used in turboPower to tail recursive form. Call the
  definition turboTPower.




