
There are additional examples.

> module PracF02 where
> import List

What is the output?? 

> tPow (a:x) = a:tPow[y| y<-x, y`mod`a == 0]
> tPow [] = []

Horner's algorithm using primitive recursion:

> horner [x] _ = x
> horner (h:t) v = h + v * horner t v


One pass partition:

> partitionOne [] p = ([],[])
> partitionOne (l:ls) p 
>     | l < p = ((l:less), more)
>     | otherwise = (less, (l:more))
>     where
>     (less,more) = partitionOne ls p
> 

> factseq :: [Integer]
> factseq = 1 : 1 : [ f | f <- zipWith (*) (tail factseq) [2 ..] ] 

You can do without list comprehension

> factseq2 = 1 : 1 : zipWith (*) (tail factseq2) [2 ..]



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

> posZneg1 id l = (filter  ((<)id) l, filter ((==)id)  l, filter ((>)id) l)

c. Define using list comprehensions

> posZneg2 id l = ( [x| x<-l, x>id], [x|x<-l, x==id], [x|x<-l, x< id])

d. Use only "primitive" recursion



> posZneg4 id [] = ([], [], [])
> posZneg4 id (l:ls)
>     | l > id = (l:as,bs,cs)
>     | l < id = (as, bs, l:cs)
>     | otherwise = (as, l:bs, cs)
>     where
>     (as, bs, cs) = posZneg4 id ls

Another solution:

> posZneg3 id [] = ([],[],[])
> posZneg3 id (l:ls)
>     | l > id = add3tuple([l],[],[])(posZneg3 id ls)
>     | l==id  = add3tuple([],[l],[])(posZneg3 id ls)
>     | l < id = add3tuple([],[],[l])(posZneg3 id ls)
>     where
>      add3tuple(a,b,c)(r,s,t)=(a++r,b++s,c++t)








> qs [] = []
> qs (x:xs) = qs (less) ++ [x] ++ qs(more)
>      where
>      (less,more) = partitionOne xs x




> before p = length . takeWhile (not.p)

> lengthBefore p = length . takeWhile (not.p)

> capitalUntil p str = [toUpper l | l <- takeWhile (not.p) str]

> reverseUntil p = reverse . takeWhile (not . p)


