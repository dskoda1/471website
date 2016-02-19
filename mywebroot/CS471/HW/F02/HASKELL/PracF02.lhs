
There are additional examples.

> module PracF02 where
> import List

What is the output?? 

> tPow (a:x) = a:tPow[y| y<-x, y`mod`a == 0]
> tPow [] = []



Do Horner algorithm using primitive recursion

> horner [x] _ = x
> horner (h:t) v =

do factorial with circle lists.

Write a partition function that goes through a list in one pass and returns 
a tuple (lessLst, moreLst) where lessLst has all the element less than a pivot
and moreLst has all the elements more than a pivot.

> partitionOne [] p = ([],[])
> partitionOne (l:ls) p 
>     | l < p = ?
>     | otherwise = ?
>     where
>     (less,more) = ?
> 




Define a function, posZneg, that returns a tuple of lists,
    posZneg id list
breaks list into a 3-tuple of list, ([items >id],[items=id],[idea<id]), i.e.

     test> posZneg 0 [10,0,1,-4,-3,0,-4]
     ([10,1], [0,0],[-4,-3,-4])
     test> posZneg 'Z' "bZAaZ"
     ("ba","ZZ","A")

a) What is the most general type of posZneg?

ANSWER: Ord =>a [a]->([a],[a],[a])

b. Define using only HOF

> posZneg1 id l =  Do later

c. Define using list comprehensions

> posZneg2 id l =

d. Use only "primitive" recursion


> posZneg4 id [] = ([], [], [])
> posZneg4 id (l:ls)
>     | l > id = ?
>     | l < id = ?
>     | otherwise = (as, l:bs, cs)
>     where
>     (as, bs, cs) = ?





> qs [] = []
> qs (x:xs) = qs (less) ++ [x] ++ qs(more)
>      where
>      (less,more) = partitionOne xs x

