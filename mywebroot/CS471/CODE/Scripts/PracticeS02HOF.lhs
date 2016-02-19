> module PracticeS02HOF where
> import List

Note: The function composition , . , is another example of "polymorphism"
Composition --- glueing functions together!!!



Practice 1:
What does  map(\x->(x+1)/2) xs do?

Rewrite this example:
    map(\x->(x+1)/2) xs
using composition instead of lambda expressions.
> p1 = map ((/2).(1+)) 



Practice 2:
What does 
   map f(map g xs)
do?


Rewrite this using function composition and a single call to map.  

How would rewrite p1 applying p2?

> p2 = map (f . g)
> p1r = p2 (/2) (1+)


Practice 3:
What is the type of ys in:
   xs = [1,2,3]::[Float]
   ys = map (+) xs

Prelude> :t map (+) ([1,2,3]::[Float])
map (+) [1,2,3] :: [Float -> Float]  

Practice 4:
What is the principal type of each of the following expressions (if it exists).
    map map
    foldl foldl
    map foldl1
    map . foldl1

Prelude> :t map map
map map :: [a -> b] -> [[a] -> [b]]
Prelude> :t map foldl1
map foldl1 :: [a -> a -> a] -> [[a] -> a]
Prelude> :t map . foldl1
map . foldl1 :: (a -> a -> a) -> [[a]] -> [a]     

Prelude> map (\f -> f [3,4,5])  (map map [(*) 3,(-) 4])
[[9,12,15],[1,0,-1]]
(69 reductions, 169 cells)
Prelude>                        


Prelude> map foldl [(+),(*)]
[foldl (instNum_v35 Num_+),foldl (instNum_v35 Num_*)]
(21 reductions, 99 cells)

Prelude> map (\v ->  v [4000,1000]) (map foldr1 [div,(-)])
[4,3000]
(94 reductions, 158 cells)   

Prelude> :t map . foldl1
map . foldl1 :: (a -> a -> a) -> [[a]] -> [a]
Prelude> (map . foldl1) (-) [[1,2,3],[3,2,1],[100,200,300]]
[-4,0,-400]
(58 reductions, 113 cells)     


Describe each of the following infinite lists.

xs = 1:map(*2) xs
