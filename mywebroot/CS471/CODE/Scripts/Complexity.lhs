Changed Apr 18, 2004

Code to accompany CS471/CS571 notes,  2004
There are may be additional examples besides the ones in the notes and
chapter 19 of Thompson's "The Craft of Functional Progeramming"" 2nd

The +s displays statistics about the total number of reductions and cells
This is a very crude measure       
     -- the amount of work done is not measured only number of reductions
     -- the cell count does not give about the number of cells that are being
        used at any given time.  
Useful for comparing general trends of same algorithms with 
  inputs of different siz
http://www.gslt.hum.gu.se/~leifg/vu/ps/doc/hugs98usersman.pdf


> module Complexity where


exam1 60000 works
exam2 60000 has a error with garbage collecting


> exam1 n  = [1 .. n] ++ [1 .. n]

> exam2 n = list ++ list
>    where
>    list = [1 .. n]



Dragging Problem -- O(1) space complexity for exam3 and 
                    O(n) space complexity for exam4
                        
Try running the following programs with n = 60000
On my computer exam3 with 18 garbage collections
               exam4 halted after attempting the 60 garbage collecting


> exam3 n = [ 1.. n ] ++ [last [ 1..n]]
> exam4 n = list ++ [last list]
>     where
>     list = [1..n]






> fib :: Int -> Int
> fib 1 = 1
> fib 2 = 1
> fib n = fib (n-2) + fib (n-1)

  # Faster version:
Dynamic programming.

> fib1 1 = 1
> fib1 n = fiba n 1 0 1
>   where
>   fiba n c a b =
>     if c == n then b
>     else fiba n (c+1) b (a+b)


> fibP 0 = (0,1)
> fibP n = (y,x+y)
>     where
>     (x,y) = fibP (n-1)


Using circular lists (Defined directly)

> fibs = 0 : 1 : zipWith (+) fibs (tail fibs)



Dynamic programming: maximal common subsequence
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The naive algorithm ...

> mLen :: Eq a => [a] -> [a] -> Int
> 
> mLen xs []        = 0
> mLen [] ys        = 0
> mLen (x:xs) (y:ys) 
>     | x==y        = 1 + mLen xs ys
>     | otherwise   = max (mLen xs (y:ys)) (mLen (x:xs) ys)

... translated to talk about sub-components of lists, described by their
endpoints ...

> maxLen :: Eq a => [a] -> [a] -> Int -> Int -> Int

> maxLen xs ys 0 j = 0 
> maxLen xs ys i 0 = 0
> maxLen xs ys i j
>     | xs!!(i-1) == ys!!(j-1)  = (maxLen xs ys (i-1) (j-1)) + 1
>     | otherwise               = max (maxLen xs ys i (j-1))
>	                                  (maxLen xs ys (i-1) j)

... and then transliterated into a memoised version.

> maxTab ::  Eq a => [a] -> [a] -> [[Int]]

> maxTab xs ys
>     = result
>     where 
>     result = [0,0 .. ] : zipWith f [0 .. ] result
>     f i prev  
>        = ans
>        where
>        ans   = 0 : zipWith g [0 .. ] ans
>        g j v 
>          | xs!!i == ys!!j      = prev!!j + 1
>          | otherwise           = max v (prev!!(j+1))


Greedy algorithm

