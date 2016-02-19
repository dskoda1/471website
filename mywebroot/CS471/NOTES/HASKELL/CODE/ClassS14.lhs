> module ClassS14
>    where

A problem posed by L. Collatz in 1937, also called Hasse's algorithm, 
Kakutani's problem, Syracuse algorithm, Syracuse problem, Thwaites conjecture, 
and Ulam's problem (Lagarias 1985).

For any value n, apply the following collatz function:

    * for even n, collatz(n) = n/2
    * for odd n, collatz(n) = (3*n+1)/2
    
Then let the sequence  cn be defined as ci = collatz(ci-1))$, with 
c0 an arbitrary natural seed value.

It is conjectured that the sequence $ c_0, c_1, c_2,  will always end in 
 1,4,2 , repeating infinitely

i.e. collatz(1) ~> 4

*ClassS14> collatz 11
34
*ClassS14> collatz 34
17


collatz :: Integral a => a -> a
collatz 1 = 1
collatz n = if (odd n)
             then ((3 * n) + 1)
             else n `div` 2
             
> collatz ::  (Integral b) => b -> b
> collatz n
>   | even n = div n 2
>   | otherwise = (3*n +1)  


*ClassS14> (.) (take 20) collatzSeqM 11
[11,34,17,52,26,13,40,20,10,5,16,8,4,2,1,4,2,1,4,2]


> collatzSeqM ::  (Integral b) => b -> [b]
> collatzSeqM n  = seq
>   where
>   seq = n :map collatz seq

> collatzSeq ::  (Integral b) => b -> [b]
> collatzSeq n  = seq
>   where
>   seq = n : [collatz x | x<- seq ]

> collatzSeq2::(Integral a) => a ->  [a]
> collatzSeq2 = iterate collatz 

> collatzSequence = terminate . iterate collatz
>  where
>   terminate (1:_) = [1]
>   terminate (x:xs) = x:terminate xs

