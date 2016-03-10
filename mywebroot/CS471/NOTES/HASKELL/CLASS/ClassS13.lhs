> module ClassS13
>     where

foldr :: (a -> b -> b) -> b -> [a] -> b
foldl :: (a -> b -> a) -> a -> [b] -> a
(:) :: a -> [a] -> [a]

map :: (a -> b) -> [a] -> [b]

foldr map :: [a] -> [a -> a] -> [a]

map map :: [a -> b] -> [[a] -> [b]]
(.) :: (b -> c) -> (a -> b) -> a -> c






map foldr :: [a -> b -> b] -> [b -> [a] -> b]

Prelude> :t foldl map

<interactive>:1:7:
    Couldn't match expected type `a0 -> b0' with actual type `[b0]'
    Expected type: (a0 -> b0) -> [a0] -> a0 -> b0
      Actual type: (a0 -> b0) -> [a0] -> [b0]
    In the first argument of `foldl', namely `map'
    In the expression: foldl map

(.) map :: (a -> a1 -> b) -> a -> [a1] -> [b]
map (.) :: [b -> c] -> [(a -> b) -> a -> c]




What is the most general type (if any) of
   A) map map
   B) foldl foldl
   C) map foldl
   D) map . foldl

What is the value of :
   (map . foldl1) (-) [[1,2,3],[3,2,1],[100,200,300]]
    map (\v ->  v [4000,1000]) (map foldr1 [div,(-)])
    map (\f -> f [3,4,5])  (map map [(*) 3,(-) 4])


What is the value of mapmap ? Try and figure it out then run it.

> mapmap = map (\x-> x [1,2,3])(map map [odd,even])








> mys1 = foldr ( \ x acc -> x : acc) [ ]
> mys2 = foldl ( \acc x -> x : acc) [ ]

Problem 1. Define prodRtoL nums, that given a non empty list of Nums, nums,  
      the result  is a list of the prod of the numbers in nums  such that first 
      value in the output is the product of       all the number nums, the 
      second value in the output is the product of all the numbers in nums 
      except the first value in nums, etc.  Use explicit recursion.
      i.e.
     ...> prodRtoL [3,4,1,2,3]
     [72,24,6,6,3]



> prodRtoL (n:ns) = product (n:ns) : prodRtoL ns
> prodRtoL [] = []

> prodRtoLp nums@(n:ns) = product nums : prodRtoLp ns
> prodRtoLp [] = []


Problem 4: Redo problem 1 by filling in the blanks below ok

    > prodRtoLHOF  = foldr op [] 
    >    where
    >     op  y [] = _____________ 
    >     op  y (x:xs) = ___________


> prodRtoLHOF  = foldr op [] 
>  where
>   op  y [] = [y]
>   op  y (x:xs) = (y*x):x:xs

>  merge (x:xs) (y:ys) 
>       | x == y          = x : merge xs     ys 
>       | x < y           = x : merge xs     (y:ys) 
>       | otherwise       = y : merge (x:xs) ys


