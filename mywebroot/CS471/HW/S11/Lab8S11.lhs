> module Lab8S11
>    where

problem 1&2:
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



 
  1e:
  Define powerS by modifing powerT to force the accumulator argument 
  to be evaluated prematurely, using the operator ($!) as illustrated in factS.
Answer:


  2b:
  Convert the algorithm used in turboPower to tail recursive form. Call the
  definition turboTPower.



You may use either hugs or ghci for this assignment.

My results -- Nov 2009...
Hugs --
Lab8S11> power 17 16370
(212843 reductions, 41591143 cells, 42 garbage collections)
Lab8S11> power 17 16380
(196480 reductions, 327474 cells)
ERROR - Control stack overflow

Lab8S11> powerT 17 16370
(196473 reductions, 41574775 cells, 42 garbage collections)
Lab8S11> powerT 17 16380
(180196 reductions, 311259 cells)
ERROR - Control stack overflow


Lab8S11> turboPower 17 16380
(1601 reductions, 83139 cells)
Lab8S11> turboPower 17 160000
(1660 reductions, 511961 cells)
Lab8S11> turboPower 17 1600000
(1941 reductions, 3913371 cells, 6 garbage collections)
ERROR - Garbage collection fails to reclaim sufficient space

-- GHCI
*Lab8S11> power 17 340000
(298.64 secs, 30664349260 bytes)
*Lab8S11> power 17 350000
*** Exception: stack overflow
*Lab8S11> powerT 17 360000
(238.89 secs, 34362316296 bytes)
*Lab8S11> powerT 17 500000
(568.18 secs, 65712438828 bytes)
*Lab8S11> powerT 17 550000
*** Exception: stack overflow

*Lab8S11> turboPower 17 550000
(5.25 secs, 282757164 bytes)
*Lab8S11> turboPower 17 7000000
(92.21 secs, 4072023392 bytes)
*Lab8S11> turboPower 17 70000000
(1087.39 secs, 46675362320 bytes)
 

