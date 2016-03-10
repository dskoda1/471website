> module HaskellS032SHOW
>     where

Problem 1: (Very easy)

> a :: Integer -> Integer
> a 0 = 1
> a 1 = 2
> a n = a (n-1) * a (n-2)  ---answer



Problem 2: (very easy)
Other file
Problem 3

> sumtuple [(x,y)] = [x+y]
> sumtuple ((x,y):t) = x+y : sumtuple t

> sumtuple2 ((x,y):t) = x+y : sumtuple2 t
> sumtuple2 [] = []


Problem 4

> isIncreasing (h:h2:t) = (h < h2) && isIncreasing(h2:t)
> isIncreasing [h] = True
 
Not needed.  Problems since [] is a polytype and we need a constaint of type in EQ. 
 > isIncreasing [] = True  --- Just in case there is an empty list.



Problem 5
accumProd([V],[V]).
accumProd([H|T],[RH,RP|RT]):-accumProd(T,[RP|RT]),
                             RH is RP * H.

> accumProd [v] = [v]
> accumProd (h:t) = h* head (accumProd t) : accumProd t

or
Note below that we are using nested functions.  So the nested function "hides"
the outer definition of "tail".


> accumProd2 [v] = [v]
> accumProd2 (h:t) = h* head tail : tail
>     where
>     tail = accumProd2 t  

